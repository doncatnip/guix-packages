(define-module (wip packages wm)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix build-system cmake)
  ;#:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages documentation)
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

(define-public awesome35
  (package
    (name "awesome35")
    (version "3.5.9")
    (source (origin
      (method url-fetch)
      (uri (string-append
            "https://awesome.naquadah.org/download/awesome-"
            version ".tar.xz"))
      (sha256 (base32 "0kynair1ykr74b39a4gcm2y24viial64337cf26nhlc7azjbby67"))))
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
              ("dbus" ,dbus)
              ("gdk-pixbuf" ,gdk-pixbuf)
              ("glib" ,glib)
              ("imlib2" ,imlib2)
              ("libev" ,libev)
              ("libxcb" ,libxcb)
              ("libxcursor" ,libxcursor)
              ("libxdg-basedir" ,libxdg-basedir)
              ("lua" ,lua-5.1)
              ("pango" ,pango)
              ("startup-notification" ,startup-notification)
              ("xcb-util" ,xcb-util)
              ("xcb-util-cursor" ,xcb-util-cursor)
              ("xcb-util-image" ,xcb-util-image)
              ("xcb-util-keysyms" ,xcb-util-keysyms)
              ("xcb-util-renderutil" ,xcb-util-renderutil)
              ("xcb-util-wm" ,xcb-util-wm)))

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

