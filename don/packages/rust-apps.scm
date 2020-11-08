(define-module (don packages rust-apps)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (don packages crates-io)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control))

(define-public bandwhich
  (package
    (name "bandwhich")
    (version "0.20.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bandwhich" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xc02wb9kr26srn4anqa5bh2sqrdm6p01lbp3cicmq3nim0yibqc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f ;; does not appear to contain tests
        #:cargo-inputs
        (("rust-async-trait" ,rust-async-trait-0.1)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-crossterm" ,rust-crossterm-0.17)
         ("rust-failure" ,rust-failure-0.1)
         ("rust-ipnetwork" ,rust-ipnetwork-0.16)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-netstat2" ,rust-netstat2-0.9)
         ("rust-pnet" ,rust-pnet-0.26)
         ("rust-procfs" ,rust-procfs-0.7)
         ("rust-regex" ,rust-regex-1)
         ("rust-resolv-conf" ,rust-resolv-conf-0.6)
         ("rust-structopt" ,rust-structopt-0.3)
         ("rust-sysinfo" ,rust-sysinfo-0.15)
         ("rust-tokio" ,rust-tokio-0.2)
         ("rust-trust-dns-resolver"
          ,rust-trust-dns-resolver-0.18)
         ("rust-tui" ,rust-tui-0.12)
         ("rust-unicode-width" ,rust-unicode-width-0.1))
        #:cargo-development-inputs
        (("rust-cargo-insta" ,rust-cargo-insta-0.11)
         ("rust-insta" ,rust-insta-0.12)
         ("rust-http-req" ,rust-http-req-0.7)
         ("rust-packet-builder" ,rust-packet-builder-0.5)
         ("rust-pnet-base" ,rust-pnet-base-0.26)
         ("rust-regex" ,rust-regex-1)
         ("rust-zip" ,rust-zip-0.5))))
    (home-page "https://github.com/imsnif/bandwhich")
    (synopsis
      "Display current network utilization by process, connection and remote IP/hostname")
    (description
      "Display current network utilization by process, connection and remote IP/hostname")
    (license license:expat)))
