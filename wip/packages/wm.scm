(define-module (wip packages wm)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  ;#:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gnome)
  ;#:use-module (gnu packages m4)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages image)
  ;#:use-module (gnu packages pcre)
  #:use-module (gnu packages libevent)
  ;#:use-module (gnu packages fribidi)
  ;#:use-module (gnu packages maths)
  ;#:use-module (gnu packages web)
  ;#:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages lua)
  #:use-module (guix download))


(define-public luadl-5.2
  (package (inherit lua)
    (name "luadl")
    (arguments
     '(#:modules ((guix build gnu-build-system)
                    (guix build utils)
                    (srfi srfi-1))
       #:test-target "test"
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda _ (zero? (system* "make" "LDFLAGS=-ldl" "CFLAGS=-fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX" "linux"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (zero? (system* "make" "install"
                               (string-append "INSTALL_TOP=" out)
                               (string-append "INSTALL_MAN=" out
                                              "/share/man/man1")))))))))
    (description
     "Lua is a powerful, fast, lightweight, embeddable scripting language.
      For mor information see lua package.
      This version is built with dynamic loading support.")
    (license license:x11)))


(define-public lua-lgi
  (package
    (name "lua-lgi")
    (version "0.9.1")
    (source
      ;(local-file "/home/boo/stuff/devel/lua-lgi/lgi-0.9.1" #:recursive? #t))
      (origin
        (method url-fetch)
        (uri (string-append
              "https://github.com/pavouk/lgi/archive/"
              version ".tar.gz"))
        (sha256 (base32 "1fmgdl5y4ph3yc6ycg865s3vai1rjkyda61cgqxk6zd13hmznw0c"))
      )
    )
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key inputs #:allow-other-keys)
             ; tests don't honor LIBRARY_PATH
             (setenv "LD_LIBRARY_PATH" (getenv "LIBRARY_PATH"))

             ; Skip GTK tests:
             ;   gtk3 - can't get it to run with the xorg-server config below
             ;          and some non-gtk tests will also fail
             ;   gtk2 - lots of functions aren't implemented
             ; We choose gtk2 as the lesser evil and simply skip the test.
             ; as of 22/08/2016 awesome is the only package dependent on lgi but
             ; doesn't need gtk.
             (substitute* "./tests/test.lua"
                        (("'gtk.lua',") "-- 'gtk.lua',"))
             ; lua version and therefore install directories are hardcoded
             ; for some reason
             (substitute* "./lgi/Makefile"
                        (("LUA_VERSION=5.1") "LUA_VERSION=5.2"))

             ;; There must be a running X server and make check doesn't start one.
             ;; Therefore we must do it.
             (system (format #f "~a/bin/Xvfb :1 &" (assoc-ref inputs "xorg-server")))
             (setenv "DISPLAY" ":1")
           ))
       )
       #:make-flags
         (let ((out (assoc-ref %outputs "out")))
           (list "CC=gcc"
             (string-append "PREFIX=" (assoc-ref %outputs "out"))
           ))))

    (inputs
     `(("gobject-introspection" ,gobject-introspection)
       ("glib" ,glib)
       ("pango", pango)
       ("gtk", gtk+-2)
       ("luadl" ,luadl-5.2) ;lua recompiled with dynamic loading support
       ("cairo" ,cairo)
       ("libffi" ,libffi)
       ("xauth" ,xauth)
       ("xorg-server", xorg-server)
      ))
    (native-inputs
     `(("pkg-config" ,pkg-config)
      ))
    (home-page "https://github.com/pavouk/lgi/")
    (synopsis "Lua bridge to GObject based libraries")
    (description "LGI is gobject-introspection based dynamic Lua binding to GObject based
libraries. It allows using GObject-based libraries directly from Lua.

Notable examples are GTK+, GStreamer and Webkit.")
    (license license:expat)
))


(define-public awesome35
  (package
    (name "awesome35")
    (version "3.5.9")
    (source (origin
      (method url-fetch)
      (uri (string-append
            "https://awesome.naquadah.org/download/awesome-"
            version ".tar.xz"))
      (sha256 (base32 "0kynair1ykr74b39a4gcm2y24viial64337cf26nhlc7azjbby67"))
      (modules '((guix build utils)
                 (srfi srfi-19)))
      (snippet
       ;; Remove non-reproducible timestamp and use the date of the
       ;; source file instead.
       '(substitute* "common/version.c"
          (("__DATE__ \" \" __TIME__")
           (date->string
            (time-utc->date
             (make-time time-utc 0
                        (stat:mtime (stat "awesome.c"))))
            "\"~c\""))))
      (patches (search-patches "awesome-reproducible-png.patch"))))

    (build-system cmake-build-system)
    (native-inputs `(("asciidoc" ,asciidoc)
                     ("docbook-xsl" ,docbook-xsl)
                     ("doxygen" ,doxygen)
                     ("gperf" ,gperf)
                     ("imagemagick" ,imagemagick)
                     ("libxml2" ,libxml2)         ;for XML_CATALOG_FILES
                     ("pkg-config" ,pkg-config)
                     ("xmlto" ,xmlto)))
    (inputs `(("cairo" ,cairo)
              ("gobject-introspection" ,gobject-introspection)
              ("dbus" ,dbus)
              ("gdk-pixbuf" ,gdk-pixbuf)
              ("glib" ,glib)
              ("imlib2" ,imlib2)
              ("libev" ,libev)
              ("libxcb" ,libxcb)
              ("libxcursor" ,libxcursor)
              ("libxdg-basedir" ,libxdg-basedir)
              ("luadl" ,luadl-5.2)
              ("lua-lgi",lua-lgi)
              ("pango" ,pango)
              ("startup-notification" ,startup-notification)
              ("xcb-util" ,xcb-util)
              ("xcb-util-cursor" ,xcb-util-cursor)
              ("xcb-util-image" ,xcb-util-image)
              ("xcb-util-keysyms" ,xcb-util-keysyms)
              ("xcb-util-renderutil" ,xcb-util-renderutil)
              ("xcb-util-wm" ,xcb-util-wm)))

    (arguments
     `(;; Let compression happen in our 'compress-documentation' phase so that
       ;; '--no-name' is used, which removes timestamps from gzip output.
       #:configure-flags '("-DCOMPRESS_MANPAGES=off")

       #:phases (modify-phases %standard-phases
                  (add-before 'build 'xmlto-skip-validation
                    (lambda _
                      ;; We can't download the necessary schema, so so skip
                      ;; validation and assume they're valid.
                      (substitute* "../build/CMakeFiles/man.dir/build.make"
                        (("/xmlto")
                         (string-append "/xmlto --skip-validation")))
                      #t))
                  (add-before 'configure 'set-lua-paths
                    (lambda* (#:key inputs #:allow-other-keys)
                      (setenv "LD_LIBRARY_PATH" (getenv "LIBRARY_PATH"))
                      (let ((lua-lgi (assoc-ref inputs "lua-lgi")))
                        (setenv "LUA_PATH"
                          (string-append lua-lgi
                                        "/share/lua/5.2/?.lua"))
                        (setenv "LUA_CPATH"
                          (string-append lua-lgi
                                        "/lib/lua/5.2/?.so")))))
                  (replace 'check
                    (lambda _
                      ;; There aren't any tests, so just make sure the binary
                      ;; gets built and can be run successfully.
                      (zero? (system* "../build/awesome" "-v")))))))

    (synopsis "highly configurable X window manager")
    (description "awesome manages windows dynamically in floating or tiled layouts. It is
primarily targeted at power users, developers, and all those dealing with
everyday computing tasks and looking for fine-grained control over their
graphical environment.

It is highly extensible and scriptable via the Lua programming language,
providing an easy-to-use and very well documented API to configure its
behavior.

awesome uses tags instead of workspaces, which gives better flexibility
in displaying windows, and can be entirely keyboard-driven, not needing a
mouse. It also supports multi-headed configurations; uses XCB instead of
Xlib for better performance; implements many freedesktop standards; and
can be controlled over D-Bus from awesome-client.")
    (license license:gpl2+)
    (home-page "http://awesome.naquadah.org/")
))

