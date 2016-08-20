(define-module (wip packages python)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix licenses)
  #:use-module (gnu packages python))

(define-public guix-import-debian
  (package
    (name "guix-import-debian")
    (version "0.2.dev0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
            (url "https://github.com/doncatnip/guix-import-debian.git")
            (commit "e334c7920e0c0798c8609ed2833267c361af7a80")))
        ;(method url-fetch)
        ;(uri (string-append
        ;       "https://pypi.python.org/packages/ce/53/ff3ce0f6633d6823936132fd36237bfeb0d6d062ba46616cd2ad0175e2ce/guix-import-debian-"
        ;       version
        ;       ".tar.bz2"))
        (sha256
          (base32
            "07ympgbr40a8h1daijimzgk6x37whwra7rpygwfzvbnnb6fmd39r"))))
    (build-system python-build-system)
    (inputs
      `(("python-debian" ,python-debian)
        ("python-numconv" ,python-numconv)
        ("python-requests"
         ,python-requests)
        ("python-chardet",python-chardet)
        ("python-six" ,python-six)))
    (native-inputs
       `(("python-setuptools" ,python-setuptools)))
    (home-page
      "https://gitlab.com/htgoebel/guix-import-debian")
    (synopsis
      "Helper for converting Debian packages into Guix package definitions")
    (description
      "Helper for converting Debian packages into Guix package definitions")
    (license #f)))

(define-public python-numconv
  (package
    (name "python-numconv")
    (version "2.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://pypi.python.org/packages/f5/12/a4a67c7923d260d3f36fd4f683d26e2ca80106d58f5580bc2c21a7ff80d1/numconv-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0q3fb5lkgmc5639zgwsvzbp4papr2fgmbhbccbynhp2qxxdidvq6"))))
    (build-system python-build-system)
    (arguments
           '(#:tests? #f       ;no tests
            ))
    (native-inputs
       `(("python-setuptools" ,python-setuptools)))

    (home-page "https://tabo.pe/projects/numconv/")
    (synopsis
      "Python library to convert strings to numbers and numbers to strings.")
    (description
      "Python library to convert strings to numbers and numbers to strings.")
    (license #f)))
