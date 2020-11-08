(define-module (don packages crates-io)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control))

(define-public rust-pnet-base-0.26
  (package
    (name "rust-pnet-base")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-base" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1d8i670dy8hb5isjj75avhwry20hx90ji9m9n1kgl2i22mz5zkdp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-serde" ,rust-serde-1))
        #:cargo-development-inputs
        (("rust-serde-test" ,rust-serde-test-1))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Fundamental base types and code used by pnet.")
    (description
      "Fundamental base types and code used by pnet.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-sys-0.26
  (package
    (name "rust-pnet-sys")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0b476fl39mh0f8wn3ryd22zipaqnj16y576p4mxib7v0a86dxw3k"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f                       ;tests need socket communication
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-winapi-build" ,rust-winapi-build-0.1)
         ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Access to network related system function and calls.")
    (description
      "Access to network related system function and calls.")
    (license (list license:expat license:asl2.0))))

(define-public rust-netmap-sys-0.1
  (package
    (name "rust-netmap-sys")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "netmap-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0wgwjx2hdqbjvdpccqb0cg4gjxazgxfz8s966bq5g8z56xik95a5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))
        #:cargo-development-inputs
        (("rust-cc" ,rust-cc-1))))
    (home-page
      "http://info.iet.unipi.it/~luigi/netmap/")
    (synopsis
      "Bindings to netmap - the fast packet I/O framework")
    (description
      "Bindings to netmap - the fast packet I/O framework")
    (license license:bsd-2)))

(define-public rust-pcap-0.7
  (package
    (name "rust-pcap")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pcap" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "14blflnbj87z3ajlj1hszsl6k7rwa338y4aw2yjm2j0xdpjvj4pr"))))
    (build-system cargo-build-system)
    (inputs
      `(("libpcap" ,libpcap)))
    (arguments
      `(#:tests? #f          ; Can't find crate for `futures` ??
        #:cargo-inputs
        (("rust-clippy" ,rust-clippy-0.0)
         ("rust-futures" ,rust-futures-0.3)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-tokio-core" ,rust-tokio-core-0.1))
        #:cargo-development-inputs
        (("rust-futures" ,rust-futures-0.3)
         ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/ebfull/pcap")
    (synopsis
      "A packet capture API around pcap/wpcap")
    (description
      "This package provides a packet capture API around pcap/wpcap")
    (license (list license:expat license:asl2.0))))

(define-public rust-ipnetwork-0.12
  (package
    (name "rust-ipnetwork")
    (version "0.12.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ipnetwork" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1aq1109s1vrqa9z678zfin1vihf66bdkkbhym6mqm0lhmhck2y3h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-clippy", rust-clippy-0.0))))
    (home-page "https://crates.io/crates/ipnetwork")
    (synopsis "Work with IP CIDRs in Rust")
    (description "This package provides a library to work with IP CIDRs in
Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ipnetwork-0.16
  (package
    (name "rust-ipnetwork")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ipnetwork" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "07nkh9djfmkkwd0phkgrv977kfmvw4hmrn1xxw4cjyx23psskv5q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://crates.io/crates/ipnetwork")
    (synopsis "Work with IP CIDRs in Rust")
    (description "This package provides a library to work with IP CIDRs in
Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-datalink-0.26
  (package
    (name "rust-pnet-datalink")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-datalink" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05grwpfiar3cf7i70zmr30yjvdzjffa3q8rkk7ja2zqbdqfsw63k"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ipnetwork" ,rust-ipnetwork-0.16)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-netmap-sys" ,rust-netmap-sys-0.1)
         ("rust-pcap" ,rust-pcap-0.7)
         ("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-sys" ,rust-pnet-sys-0.26)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Cross-platform, datalink layer networking.")
    (description
      "Cross-platform, datalink layer networking.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-macros-support-0.26
  (package
    (name "rust-pnet-macros-support")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-macros-support" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0nrw8qlgl2c1czyn753v6vnbhw87f306iclsvajd0rk7qg0cbyfs"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-pnet-base" ,rust-pnet-base-0.26))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis "Support library for libpnet_macros")
    (description
      "Support library for libpnet_macros")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntex-pos-0.42
  (package
    (name "rust-syntex-pos")
    (version "0.42.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex_pos" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "19kij62spjzvls0bknvcpfvy3m6gnnmykjzyc4y82l94wn49km1z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax_pos")
    (description "This package provides a backport of @code{libsyntax_pos}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-xid-0.0.3
  (package
    (inherit rust-unicode-xid-0.2)
    (name "rust-unicode-xid")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-xid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1sqvl06884cy3hh14shik5afcv6bhsvb0gh2y267rv5lmyfg1prn"))))))

(define-public rust-syntex-errors-0.42
  (package
    (name "rust-syntex-errors")
    (version "0.42.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syntex_errors" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0imnfa8sn17igz223nxxw44lnvdq2hhsicjmj5218qbvhqr8zi04"))))
    (build-system cargo-build-system)
    (arguments
     ;;`(#:skip-build? #t
      `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-syntex-pos" ,rust-syntex-pos-0.42)
        ("rust-term" ,rust-term-0.4)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0.3))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of librustc_errors")
    (description "This package provides a backport of @code{librustc_errors}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntex-syntax-0.42
  (package
    (name "rust-syntex-syntax")
    (version "0.42.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syntex_syntax" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "13dx4vcbbavpl2yi1y53r7d9w1cv0p86bwmmmgynd5lgdr8a0a3n"))))
    (build-system cargo-build-system)
    (arguments
     ;;`(#:skip-build? #t
      `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.5)
        ("rust-log" ,rust-log-0.3)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-syntex-errors" ,rust-syntex-errors-0.42)
        ("rust-syntex-pos" ,rust-syntex-pos-0.42)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0.3))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax")
    (description "This package provides a backport of libsyntax.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntex-0.42
 (package
   (name "rust-syntex")
   (version "0.42.2")
   (source
    (origin
      (method url-fetch)
      (uri (crate-uri "syntex" version))
      (file-name
       (string-append name "-" version ".tar.gz"))
      (sha256
       (base32
        "05z3xd1f98qfl1wwl05v0pwlh3b7d78jghgdyvjj4fiqdf5b0c0a"))))
   (build-system cargo-build-system)
   (arguments
    ;;`(#:skip-build? #t
    `(#:cargo-inputs
      (("rust-syntex-errors" ,rust-syntex-errors-0.42)
       ("rust-syntex-syntax" ,rust-syntex-syntax-0.42))))
   (home-page "https://github.com/erickt/rust-syntex")
   (synopsis "Compile time syntax extension expansion")
   (description
    "This package provides a library that enables compile time
syntax extension expansion.")
   (license (list license:expat license:asl2.0))))

(define-public rust-pnet-macros-0.26
  (package
    (name "rust-pnet-macros")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-macros" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1sbxlkpyjdchpnm5q7a22g6kijwb1v6p370g80hafjp0qr95rgdv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-regex" ,rust-regex-1)
         ("rust-syntex" ,rust-syntex-0.42)
         ("rust-syntex-syntax" ,rust-syntex-syntax-0.42))
        #:cargo-development-inputs
        (("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-macros-support"
          ,rust-pnet-macros-support-0.26))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Automatic bit manipulation for binary data formats")
    (description
      "Automatic bit manipulation for binary data formats")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-packet-0.26
  (package
    (name "rust-pnet-packet")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-packet" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "10q2asgyyc27i9ilb18nk27ipva47hl41ks9lm8srl3i9n36mql9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-macros-support"
          ,rust-pnet-macros-support-0.26))
        #:cargo-development-inputs
        (("rust-glob" ,rust-glob-0.2)
         ("rust-pnet-macros" ,rust-pnet-macros-0.26)
         ("rust-syntex" ,rust-syntex-0.42))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Cross-platform, binary packet parsing and manipulation")
    (description
      "Cross-platform, binary packet parsing and manipulation")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-transport-0.26
  (package
    (name "rust-pnet-transport")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet-transport" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "044bqj2f709npl2pqyrka6sf8qb29b352g4yhi6ljh23advan4k7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-packet" ,rust-pnet-packet-0.26)
         ("rust-pnet-sys" ,rust-pnet-sys-0.26))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Cross-platform, transport layer networking.")
    (description
      "Cross-platform, transport layer networking.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pnet-0.26
  (package
    (name "rust-pnet")
    (version "0.26.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pnet" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1p02hd0k9q6vpbs1lpy8192g2z82y44qbwxwb2kg5xkjrlnz8bf6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f                       ;tests need networking
        #:cargo-inputs
        (("rust-ipnetwork" ,rust-ipnetwork-0.16)
         ("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-datalink" ,rust-pnet-datalink-0.26)
         ("rust-pnet-packet" ,rust-pnet-packet-0.26)
         ("rust-pnet-macros" ,rust-pnet-macros-0.26)
         ("rust-pnet-sys" ,rust-pnet-sys-0.26)
         ("rust-pnet-transport" ,rust-pnet-transport-0.26))
        #:cargo-development-inputs
        (("rust-version-check" ,rust-version-check-0.9)
         ("rust-glob" ,rust-glob-0.2)
         ("rust-time" ,rust-time-0.2))))
    (home-page "https://github.com/libpnet/libpnet")
    (synopsis
      "Cross-platform, low level networking using the Rust programming language.")
    (description
      "Cross-platform, low level networking using the Rust programming language.")
    (license (list license:expat license:asl2.0))))

(define-public rust-netstat2-0.9
  (package
    (name "rust-netstat2")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "netstat2" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lvzg33rbkglvdssiy0fkqgy0lqpqsqm6y36rjykf09189jc2f53"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-num-derive" ,rust-num-derive-0.3)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/ohadravid/netstat2-rs")
    (synopsis
      "Cross-platform library to retrieve network sockets information.")
    (description
      "Cross-platform library to retrieve network sockets information.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nom-2
  (package
    (inherit rust-nom-4.2)
    (name "rust-nom")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1zv6ig7nw532rl4p35jsahglfhyyznjkblwa6si6c0plxhlsflfg"))))
    (build-system cargo-build-system)
    (arguments
     ;;`(#:tests? #f      ; stream::tests::seeking_consumer fails
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-0.2)
        ("rust-regex" ,rust-regex-0.2))))))

(define-public rust-procinfo-0.4
  (package
    (name "rust-procinfo")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "procinfo" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "175l4cprsb56jrkycpz0743clgc8fyhxv4i8hhgqjd967mzl5cba"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f     ; pid::status::tests::test_status fails
        #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-nom" ,rust-nom-2))
        #:cargo-development-inputs
        (("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page "https://github.com/danburkert/procinfo-rs")
    (synopsis
      "A library for accessing Linux process and system information")
    (description
      "This package provides a library for accessing Linux process and system information")
    (license (list license:expat license:asl2.0))))

(define-public rust-procfs-0.7
  (package
    (name "rust-procfs")
    (version "0.7.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "procfs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0gkbbhf35qi7d3dwywhbav1h45gknhkwj5zlwil6w8cwyqzfjd64"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f   ; 2/58 failed tests
                      ; process::status::tests::test_proc_status_for_kthreadd
                      ; process::tests::test_error_handling
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libflate" ,rust-libflate-1))
        #:cargo-development-inputs
        (("rust-procinfo" ,rust-procinfo-0.4)
         ("rust-failure", rust-failure-0.1))))
    (home-page "https://github.com/eminence/procfs")
    (synopsis
      "Interface to the linux procfs pseudo-filesystem")
    (description
      "Interface to the linux procfs pseudo-filesystem")
    (license (list license:expat license:asl2.0))))

(define-public rust-procfs-0.8
  (package
    (name "rust-procfs")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "procfs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0jgxlrhs01s4g8jyr65diynx2m02lc8rqnwk8grmaj8g6743d8y4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f   ; 3/72 failed tests
                      ; process::status::tests::test_proc_status_for_kthreadd
                      ; process::tests::test_error_handling
                      ; sys::fs::binfmt_misc::tests::enabled
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libflate" ,rust-libflate-1))
        #:cargo-development-inputs
        (("rust-procinfo" ,rust-procinfo-0.4))))
    (home-page "https://github.com/eminence/procfs")
    (synopsis
      "Interface to the linux procfs pseudo-filesystem")
    (description
      "Interface to the linux procfs pseudo-filesystem")
    (license (list license:expat license:asl2.0))))

(define-public rust-ntapi-0.3
  (package
    (name "rust-ntapi")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ntapi" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0i5daj9sr8wyi5jkpwpybln2jqpn59z0mqfc0dpdidipwh1bjsrz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/MSxDOS/ntapi")
    (synopsis "FFI bindings for Native API")
    (description "FFI bindings for Native API")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sysinfo-0.15
  (package
    (name "rust-sysinfo")
    (version "0.15.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sysinfo" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "15mnfqynqnyv4jzi5y476rh3d8c4x02kyxss6viika5jwfz0qcv7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f   ;; test_processor fails due to get_networks()
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-ntapi" ,rust-ntapi-0.3)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/GuillaumeGomez/sysinfo")
    (synopsis
      "Library to get system information such as processes, processors, disks, components and networks")
    (description
      "Library to get system information such as processes, processors, disks, components and networks")
    (license license:expat)))

(define-public rust-cassowary-0.3
  (package
    (name "rust-cassowary")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cassowary" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lvanj0gsk6pc1chqrh4k5k0vi1rfbgzmsk46dwy3nmrqyw711nz"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/dylanede/cassowary-rs")
    (synopsis
      "A Rust implementation of the Cassowary linear constraint solving algorithm.")
    (description
      "This package provides a Rust implementation of the Cassowary linear constraint solving algorithm.

  The Cassowary algorithm is designed for naturally laying out user interfaces using linear constraints,
  like 'this button must line up with this text box'.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ncurses-5
  (package
    (name "rust-ncurses")
    (version "5.99.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ncurses" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "10kbafzgln5p2dvm0b9z8pdlcf6if2yb4dbvij1gis9p5zp9ns8m"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))
        #:cargo-development-inputs
        (("rust-cc" ,rust-cc-1)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/jeaye/ncurses-rs")
    (synopsis
      "A very thin wrapper around the ncurses TUI library")
    (description
      "This package provides a very thin wrapper around the ncurses TUI library")
    (license license:expat)))

(define-public rust-pdcurses-sys-0.7
  (package
    (name "rust-pdcurses-sys")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pdcurses-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0sqn552nz33bmd0d8lcx862lrbxg6fgk5djfblig2q7zjqkx4k88"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t     ;;Windoze library, packaged to satisfy dependencies
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))
        #:cargo-development-inputs
        (("rust-cc" ,rust-cc-1))))
    (home-page
      "https://github.com/ihalila/pdcurses-sys")
    (synopsis
      "FFI bindings for PDCurses, specifically the win32a implementation.")
    (description
      "FFI bindings for PDCurses, specifically the win32a implementation.")
    (license license:expat)))

(define-public rust-winreg-0.5
  (package
    (name "rust-winreg")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winreg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "0jkh4jj2g8g0bl7r1xvq9vv9hr4gdzphg9ndqm65q6f1jn9paym2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.3)
        ("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://github.com/gentoo90/winreg-rs")
    (synopsis "Rust bindings to MS Windows Registry API")
    (description
     "This package provides Rust bindings to MS Windows Registry API.")
    (license license:expat)))

(define-public rust-pancurses-0.16
  (package
    (name "rust-pancurses")
    (version "0.16.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pancurses" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1w0gknaz07fzq7gw7zjg1bg9xr7srp2z3zksmjr9cc23gk1qn1fk"))))
    (build-system cargo-build-system)
    (inputs
      `(("ncurses" ,ncurses)))
    (arguments
      ;;`(#:tests? #f ;; you might want to skip tests if you use guix buld
                      ;; see below
        `(#:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-ncurses" ,rust-ncurses-5)
         ("rust-pdcurses-sys" ,rust-pdcurses-sys-0.7)
         ("rust-winreg" ,rust-winreg-0.5))
        #:cargo-development-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-rand" ,rust-rand-0.4))
        #:phases
        ;; Tests need $TERM to be set, but when we do it this way, the
        ;; terminal breaks after finishing tests when using guix build
        ;; and the user needs to clear/reset or \033c the console.
        (modify-phases %standard-phases
          (add-before 'check 'pre-check
            (lambda _
              (setenv "TERM" "screen")
              #t)))))
    (home-page
      "https://github.com/ihalila/pancurses")
    (synopsis
      "pancurses is a crossplatform curses libary for Unix and Windows.")
    (description
      "pancurses is a curses libary for Rust that supports both Unix and Windows
  platforms by abstracting away the backend that it uses
  (ncurses-rs and pdcurses-sys respectively).")
    (license license:expat)))

(define-public rust-easycurses-0.12
  (package
    (name "rust-easycurses")
    (version "0.12.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "easycurses" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "10cp60lrhn1k0vg97jgzqbk03x4hmhrgxbz9m3gcmzhzbpn88m2a"))))
    (build-system cargo-build-system)
    (inputs
      `(("ncurses" ,ncurses)))
    (arguments
      `(#:cargo-inputs
        (("rust-pancurses" ,rust-pancurses-0.16))
        #:cargo-development-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3))
        #:phases
        (modify-phases %standard-phases
          (add-before 'check 'pre-check
            (lambda _
              (setenv "TERM" "screen")
              #t)))))
    (home-page "https://github.com/Lokathor/easycurses-rs")
    (synopsis
      "A crate that makes working with curses easy.")
    (description
      "This package provides a crate that makes working with curses easy.")
    (license license:zlib)))

(define-public rust-easycurses-0.13
  (package
    (name "rust-easycurses")
    (version "0.13.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "easycurses" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00xmqkp8ar6l2z83a02rhwfz9wm9v4bndcahnvyg98awpz6ssar3"))))
    (build-system cargo-build-system)
    (inputs
      `(("ncurses" ,ncurses)))
    (arguments
      `(#:cargo-inputs
        (("rust-pancurses" ,rust-pancurses-0.16))
        #:cargo-development-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3))
        #:phases
        (modify-phases %standard-phases
          (add-before 'check 'pre-check
            (lambda _
              (setenv "TERM" "screen")
              #t)))))
    (home-page "https://github.com/Lokathor/easycurses-rs")
    (synopsis
      "A crate that makes working with curses easy.")
    (description
      "This package provides a crate that makes working with curses easy.")
    (license license:zlib)))

(define-public rust-gag-0.1
  (package
    (name "rust-gag")
    (version "0.1.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gag" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1d874gmyhyqbb78k6mkk9p0sd21n5vwd5w88m2nmzp3m6bsvkh4c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-tempfile" ,rust-tempfile-3))
        #:cargo-development-inputs
        (("rust-lazy-static" ,rust-lazy-static-1))))
    (home-page "https://crates.io/crates/gag")
    (synopsis
      "Gag, redirect, or hold stdout/stderr output. Currently only *nix operating systems are supported.")
    (description
      "Gag, redirect, or hold stdout/stderr output.  Currently only *nix operating systems are supported.")
    (license license:expat)))

(define-public rust-termbox-sys-0.2
  (package
    (name "rust-termbox-sys")
    (version "0.2.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "termbox-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0qbydvrck1vvzk48ck9vy70m58ksisl9dj24imjq04lp4kmh0l32"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t))  ;; build process tries to fetch git repo
    (home-page "https://github.com/gchp/termbox-sys")
    (synopsis
      "Low level bindings for the termbox library")
    (description
      "Low level bindings for the termbox library")
    (license license:expat)))

(define-public rust-bitflags-0.2
  (package
    (inherit rust-bitflags-1)
    (name "rust-bitflags")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "09yk0lk3vjsrvfcnzljmgvz9inpjs0idykvni7kij38l5vn807x4"))))))

(define-public rust-rustbox-0.11
  (package
    (name "rust-rustbox")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustbox" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1cahyxncijdwvy9kw87ahizpfbdq76hf333y4nrhbxzssajhdzcf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-0.2)
         ("rust-gag" ,rust-gag-0.1)
         ("rust-num-traits" ,rust-num-traits-0.1)
         ("rust-termbox-sys" ,rust-termbox-sys-0.2))))
    (home-page "https://github.com/gchp/rustbox")
    (synopsis
      "A rust implementation of the termbox library")
    (description
      "This package provides a rust implementation of the termbox library")
    (license license:expat)))

(define-public rust-argh-shared-0.1
  (package
    (name "rust-argh-shared")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "argh-shared" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1cacdyl980sarjfx32v6d57snk76c7dvak3mp7fvlvc2r5n367vq"))))
    (build-system cargo-build-system)
    (home-page "https://crates.io/crates/argh_shared")
    (synopsis
      "Derive-based argument parsing optimized for code size")
    (description
      "Derive-based argument parsing optimized for code size")
    (license license:bsd-3)))

(define-public rust-argh-derive-0.1
  (package
    (name "rust-argh-derive")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "argh-derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0rxhd359d4gpac9524xx8qz13wiq3vilqnn95m0pgm0a2860rsy4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-argh-shared" ,rust-argh-shared-0.1)
         ("rust-heck" ,rust-heck-0.3)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://crates.io/crates/argh_derive")
    (synopsis
      "Derive-based argument parsing optimized for code size")
    (description
      "Derive-based argument parsing optimized for code size")
    (license license:bsd-3)))

(define-public rust-argh-0.1
  (package
    (name "rust-argh")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "argh" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gi2qp6mfc9gz2sy3w1fq8fpz3d1bvx1gmmiryicgkc7iw42yyci"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-argh-derive" ,rust-argh-derive-0.1)
         ("rust-argh-shared" ,rust-argh-shared-0.1))))
    (home-page "https://crates.io/crates/argh")
    (synopsis
      "Derive-based argument parser optimized for code size")
    (description
      "Derive-based argument parser optimized for code size")
    (license license:bsd-3)))

(define-public rust-crossterm-winapi-0.6
  (package
    (name "rust-crossterm-winapi")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossterm-winapi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1nqhjp979c6iv092dbxl6hpncwgwjciafyj1nvcpa008iqzmq9n2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/crossterm-rs/crossterm-winapi")
    (synopsis "Basic simple abstractions around common WinAPI calls")
    (description "WinAPI wrapper that provides some basic simple abstractions
around common WinAPI calls.")
    (license license:expat)))

(define-public rust-mio-0.7
  (package
    (name "rust-mio")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "114m1nmlmnb2xff9qib9fmmg532cxhavpwad7yjzzkvzymqw2ql9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-ntapi" ,rust-ntapi-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rand" ,rust-rand-0.4))))
    (home-page "https://github.com/tokio-rs/mio")
    (synopsis "Lightweight non-blocking IO")
    (description "Lightweight non-blocking IO.")
    (license license:expat)))

(define-public rust-signal-hook-0.1
  (package
    (name "rust-signal-hook")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1v85mgs4dbgw0765b9nx0jd8lamv55425aawjbhxz6cb870hhib0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.7)
        ("rust-signal-hook-registry" ,rust-signal-hook-registry-1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1)
        ("rust-mio" ,rust-mio-0.7)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-crossterm-0.17
  (package
    (name "rust-crossterm")
    (version "0.17.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossterm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1ixna5xr211nx2n40n5hsy6bpj688sbw6g132hz27bi61zb1jjbg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossterm-winapi" ,rust-crossterm-winapi-0.6)
        ("rust-parking-lot" ,rust-parking-lot-0.10)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazy-static" ,rust-lazy-static-1.4)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.7)
        ("rust-signal-hook", rust-signal-hook-0.1)
        ("rust-serde" ,rust-serde-1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/crossterm-rs/crossterm")
    (synopsis "Crossplatform terminal library for manipulating terminals")
    (description "This package provides a crossplatform terminal library for
manipulating terminals.")
    (license license:expat)))

(define-public rust-console-0.8
  (package
    (inherit rust-console-0.11)
    (name "rust-console")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "console" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
           "0hh2l4dq7f4if0y51xrja3cmzkv9b8bpnfyx21fxfci18453jixi"))))
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-termios" ,rust-termios-0.3)
        ("rust-encode-unicode" ,rust-encode-unicode-0.3)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-clicolors-control" ,rust-clicolors-control-1.0)
        ("rust-regex" ,rust-regex-1)
        ("rust-lazy-static" ,rust-lazy-static-1))))))

(define-public rust-tui-0.12
  (package
    (name "rust-tui")
    (version "0.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tui" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0zp1k8qfmz1ni16i0phbk1qv9zalj7jnyimah07vksd1jklfxsn2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f   ;; failed tests:
                      ;; buffer::tests::index_of_panics_on_out_of_bounds
                      ;; buffer::tests::pos_of_panics_on_out_of_bounds
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-cassowary" ,rust-cassowary-0.3)
         ("rust-crossterm" ,rust-crossterm-0.17)
         ("rust-easycurses" ,rust-easycurses-0.12)
         ("rust-pancurses" ,rust-pancurses-0.16)
         ("rust-rustbox" ,rust-rustbox-0.11)
         ("rust-serde" ,rust-serde-1)
         ("rust-termion" ,rust-termion-1.5)
         ("rust-unicode-segmentation"
          ,rust-unicode-segmentation-1.6)
         ("rust-unicode-width" ,rust-unicode-width-0.1))
        #:cargo-development-inputs
        (("rust-argh" ,rust-argh-0.1)
         ("rust-rand" ,rust-rand-0.7))))
    (home-page "https://github.com/fdehau/tui-rs")
    (synopsis
      "A library to build rich terminal user interfaces or dashboards")
    (description
      "This package provides a library to build rich terminal user interfaces or dashboards")
    (license license:expat)))

(define-public rust-insta-0.11
  (package
    (name "rust-insta")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "0xlv6wsby9567x7av84ym95hls8jsizw48045wlqpww6xss3my13"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-console" ,rust-console-0.8)
        ("rust-difference" ,rust-difference-2)
        ("rust-globwalk" ,rust-globwalk-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-pest" ,rust-pest-2)
        ("rust-pest-derive" ,rust-pest-derive-2)
        ("rust-ron" ,rust-ron-0.5)
        ("rust-uuid" ,rust-uuid-0.7)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-yaml" ,rust-serde-yaml-0.8))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis "Snapshot testing library for Rust")
    (description "This package provides a snapshot testing library for Rust.")
    (license license:asl2.0)))

(define-public rust-cargo-insta-0.11
  (package
    (name "rust-cargo-insta")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo-insta" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hjcqxd8ydagb61qfq2hjlbjrgrlr15kpmlhxxs09yzhc732hap2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-clap" ,rust-clap-2)
         ("rust-console" ,rust-console-0.7)
         ("rust-difference" ,rust-difference-2)
         ("rust-glob" ,rust-glob-0.2)
         ("rust-insta" ,rust-insta-0.11)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-structopt" ,rust-structopt-0.2)
         ("rust-syn" ,rust-syn-0.15)
         ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis
      "A review tool for the insta snapshot testing library for Rust")
    (description
      "This package provides a review tool for the insta snapshot testing library for Rust")
    (license license:asl2.0)))

(define-public rust-insta-0.12
  (package
    (name "rust-insta")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "0j8k8rfcbdvh2s3jfj9hj7mspl32rqxqa393cw55jhg8cb09sj8d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-console" ,rust-console-0.9)
        ("rust-difference" ,rust-difference-2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-yaml" ,rust-serde-yaml-0.8)
        ("rust-uuid" ,rust-uuid-0.8)
        ("rust-pest" ,rust-pest-2)
        ("rust-pest-derive" ,rust-pest-derive-2)
        ("rust-ron" ,rust-ron-0.5))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis "Snapshot testing library for Rust")
    (description "This package provides a snapshot testing library for Rust.")
    (license license:asl2.0)))

(define-public rust-cargo-insta-0.12
  (package
    (name "rust-cargo-insta")
    (version "0.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo-insta" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0wz9b9kvxz2zdgm0n3pfbih0sh7fvppkpmab68qd32hbprzq02h3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-clap" ,rust-clap-2)
         ("rust-console" ,rust-console-0.9)
         ("rust-difference" ,rust-difference-2)
         ("rust-glob" ,rust-glob-0.3)
         ("rust-insta" ,rust-insta-0.12)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-structopt" ,rust-structopt-0.3)
         ("rust-syn" ,rust-syn-1)
         ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis
      "A review tool for the insta snapshot testing library for Rust")
    (description
      "This package provides a review tool for the insta snapshot testing library for Rust")
    (license license:asl2.0)))

(define-public rust-packet-builder-0.5
  (package
    (name "rust-packet-builder")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "packet-builder" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1mkqsl3gs8242pvfz7i51wly0wfasdskfnrc6vyiqgvb6pc217rn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-derive-new" ,rust-derive-new-0.5)
         ("rust-ipnetwork" ,rust-ipnetwork-0.12)
         ("rust-pnet" ,rust-pnet-0.26)
         ("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-pnet-datalink" ,rust-pnet-datalink-0.26)
         ("rust-pnet-macros-support"
          ,rust-pnet-macros-support-0.26))
        #:cargo-development-inputs
        (("rust-glob" ,rust-glob-0.2))))
    (home-page
      "https://github.com/hughesac/packet_builder")
    (synopsis
      "High-level library for interacting with low-level network data.")
    (description
      "High-level library for interacting with low-level network data.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-proto-0.18
  (package
    (name "rust-trust-dns-proto")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-proto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1vmhw7vdaa6b7wfv438f272ijjl2qlpcp6b1myvif4iay8pp4fi5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-enum-as-inner" ,rust-enum-as-inner-0.3)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-failures" ,rust-failure-0.1)
        ("rust-idna" ,rust-idna-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-socket2" ,rust-socket2-0.3)
        ("rust-url" ,rust-url-2)
        ("rust-data-encoding" ,rust-data-encoding-2)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-ring" ,rust-ring-0.16)
        ("rust-serde" ,rust-serde-1)
        ("rust-tokio" ,rust-tokio-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-tokio" ,rust-tokio-0.2))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "Safe and secure DNS library")
    (description "Trust-DNS is a safe and secure DNS library.  This is the
foundational DNS protocol library for all Trust-DNS projects.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-openssl-0.18
  (package
    (name "rust-trust-dns-openssl")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-openssl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "1870s27ifsdh9plgcwwbxzvlw17r3dn9v6s0zfryf6kfp9hzpfz2"))))
    (build-system cargo-build-system)
    (inputs
      `(("openssl" ,openssl)))
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.3)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-openssl" ,rust-tokio-openssl-0.4)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.18))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio" ,rust-tokio-0.2))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "tokio-openssl extension for the Trust-DNS client")
    (description "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use tokio-openssl for TLS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-native-tls-0.18
  (package
    (name "rust-trust-dns-native-tls")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-native-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "0rcg018vdd5chd4hcmjp753qjlf4k311nmrxa5ay2hxjllzmqd1y"))))
    (build-system cargo-build-system)
    (inputs
      `(("openssl" ,openssl)))
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:tests? #f ;; tests::test_tls_client_stream_ipv4 fails
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.3)
        ("rust-native-tls" ,rust-native-tls-0.2)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-tls" ,rust-tokio-tls-0.3)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.18))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "native-tls extension for the Trust-DNS client")
    (description "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use native-tls for TLS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-rustls-0.18
  (package
    (name "rust-trust-dns-rustls")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "19vhb0xsyr0wy4p0liwhv4rqmwv6szfmmid6439gq7wah1x1hzp4"))))
    (build-system cargo-build-system)
    (inputs
      `(("openssl" ,openssl)))
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:tests? #f  ;; tests::test_tls_client_stream_ipv4 fails
       #:cargo-inputs
       (("rust-futures" ,rust-futures-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustls" ,rust-rustls-0.17)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.12)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.18)
        ("rust-webpki" ,rust-webpki-0.21))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.10))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "rustls extension for the Trust-DNS client")
    (description "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use rustls for TLS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-https-0.18
  (package
    (name "rust-trust-dns-https")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-https" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "03dapd5larsjlpk6mr4xnm2sb0h7l6dg988wjnaxd8zfi5swq5nl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ;; https_client_stream::tests::test_https_cloudflare fails
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.5)
        ("rust-data-encoding" ,rust-data-encoding-2)
        ("rust-failure", rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-h2" ,rust-h2-0.2)
        ("rust-http" ,rust-http-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustls" ,rust-rustls-0.16)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.12)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.18)
        ("rust-trust-dns-rustls" ,rust-trust-dns-rustls-0.18)
        ("rust-typed-headers" ,rust-typed-headers-0.2)
        ("rust-webpki" ,rust-webpki-0.21)
        ("rust-webpki-roots" ,rust-webpki-roots-0.18))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.7))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "DNS over HTTPS extension for the Trust-DNS client")
    (description "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use DNS over HTTPS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-trust-dns-resolver-0.18
  (package
    (name "rust-trust-dns-resolver")
    (version "0.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-resolver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
          "0cldg6y937il4kjk7rirgfhmk0chz41w7qys9h96skaznh4dzmvj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ;; failures (13/61):
                   ;; async_resolver::tests::test_domain_search
                   ;; async_resolver::tests::test_fqdn
                   ;; async_resolver::tests::test_idna
                   ;; async_resolver::tests::test_large_ndots
                   ;; async_resolver::tests::test_lookup_cloudflare
                   ;; async_resolver::tests::test_lookup_google
                   ;; async_resolver::tests::test_lookup_quad9
                   ;; async_resolver::tests::test_ndots
                   ;; async_resolver::tests::test_search_list
                   ;; hosts::tests::test_read_hosts_conf
                   ;; name_server::name_server::tests::test_name_server
                   ;; resolver::tests::test_lookup
                   ;; system_conf::unix::tests::test_read_resolv_conf
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-ipconfig" ,rust-ipconfig-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-lru-cache" ,rust-lru-cache-0.1)
        ("rust-resolv-conf" ,rust-resolv-conf-0.6)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto-0.18)
        ("rust-rustls" ,rust-rustls-0.16)
        ("rust-serde" ,rust-serde-1)
        ("rust-tokio-openssl" ,rust-tokio-openssl-0.4)
        ("rust-tokio-rustls" ,rust-tokio-rustls-0.12)
        ("rust-tokio-tls" ,rust-tokio-tls-0.3)
        ("rust-trust-dns-https" ,rust-trust-dns-https-0.18)
        ("rust-trust-dns-native-tls" ,rust-trust-dns-native-tls-0.18))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-trust-dns-openssl" ,rust-trust-dns-openssl-0.18)
        ("rust-trust-dns-rustls" ,rust-trust-dns-rustls-0.18)
        ("rust-webpki-roots" ,rust-webpki-roots-0.18))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis "Safe and secure DNS library")
    (description "Trust-DNS is a safe and secure DNS library.  This Resolver
library uses the Client library to perform all DNS queries.  The Resolver is
intended to be a high-level library for any DNS record resolution see Resolver
and AsyncResolver for supported resolution types.  The Client can be used for
other queries.")
    (license (list license:expat license:asl2.0))))

(define-public rust-http-req-0.7
  (package
    (name "rust-http-req")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http_req" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 
          "002zri361mnihr2hb72ppfr41iyllmqpdkjny4a6br91lq47qb55"))))
    (build-system cargo-build-system)
    (inputs
      `(("openssl" ,openssl)))
    (native-inputs
      `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:tests? #f  ;; failures:
                    ;; request::tests::request_connect_timeout
                    ;; request::tests::request_send
       #:cargo-inputs
       (("rust-native-tls" ,rust-native-tls-0.2)
        ("rust-unicase" ,rust-unicase-2)
        ("rust-rustls", rust-rustls-0.18)
        ("rust-webpki", rust-webpki-0.21)
        ("rust-webpki-roots", rust-webpki-roots-0.20))))
    (home-page "https://github.com/jayjamesjay/http_req")
    (synopsis
     "HTTP client with built-in HTTPS support")
    (description
     "Simple and lightweight HTTP client with built-in HTTPS support.")
    (license license:expat)))
