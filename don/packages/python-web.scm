(define-module (don packages python-web)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages time)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz))

(define-public python-kanone
  (package
    (name "python-kanone")
    (version "0.4.6")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "kanone" version))
        (sha256
          (base32
            "0h0xfpacvwp07jcskfkvpmkyaffn5xhl1rk7m6p08bsc23kjh15q"))))
    (build-system python-build-system)
    (home-page "http://github.com/doncatnip/kanone")
    (synopsis "a validation library")
    (description "a validation library")
    (license #f)))

(define-public python-starlette
  (package
    (name "python-starlette")
    (version "0.13.8")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "starlette" version))
        (sha256
          (base32
            "10v1f38qnfcqbs1m1bkdhw66120p0fzp8dl8ia1asdwl2jr2kpw2"))))
    (build-system python-build-system)
    (native-inputs
        `(("python-requests", python-requests)          ;;required for tests
          ("python-aiofiles", python-aiofiles)          ;;required for tests
          ("python-itsdangerous", python-itsdangerous)));;required for tests
    (home-page "https://github.com/encode/starlette")
    (synopsis "The little ASGI library that shines.")
    (description
      "The little ASGI library that shines.")
    (license license:bsd-3)))
