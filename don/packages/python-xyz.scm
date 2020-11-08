(define-module (don packages python-xyz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages time)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz))

(define-public python-pymeeus
  (package
    (name "python-pymeeus")
    (version "0.3.7")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "PyMeeus" version))
        (sha256
          (base32
            "0qjnk9sc65i4by2x4zm6w941a4i31fmhgwbkpbqkk87rwq4h4hsn"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/architest/pymeeus")
    (synopsis
      "Python implementation of Jean Meeus astronomical routines")
    (description
      "Python implementation of Jean Meeus astronomical routines")
    (license #f)))

(define-public python-convertdate
  (package
    (name "python-convertdate")
    (version "2.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "convertdate" version))
        (sha256
          (base32
            "0nf1vkcvggrxg22jsk0p4dmda46c4hs1wj6d4qpp78irbx6s9n1g"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f))                    ; PyPI tarball lacks tests
    (propagated-inputs
      `(("python-pymeeus" ,python-pymeeus)
        ("python-pytz" ,python-pytz)))
    (home-page
      "https://github.com/fitnr/convertdate")
    (synopsis
      "Converts between Gregorian dates and other calendar systems.Calendars included: Baha'i, French Republican, Hebrew, Indian Civil, Islamic, ISO, Julian, Mayan and Persian.")
    (description
      "Converts between Gregorian dates and other calendar systems.Calendars included: Baha'i, French Republican, Hebrew, Indian Civil, Islamic, ISO, Julian, Mayan and Persian.")
    (license license:expat)))

(define-public python-korean-lunar-calendar
  (package
    (name "python-korean-lunar-calendar")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "korean_lunar_calendar" version))
        (sha256
          (base32
            "0p97r21298ipgvsqh978aq2n6cvybzp8bskcvj15mm1f76qm9khj"))))
    (build-system python-build-system)
    (home-page
      "https://github.com/usingsky/korean_lunar_calendar_py")
    (synopsis "Korean Lunar Calendar")
    (description "Korean Lunar Calendar")
    (license license:expat)))

(define-public python-holidays
  (package
    (name "python-holidays")
    (version "0.10.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "holidays" version))
        (sha256
          (base32
            "1k0ka07sc7w6x83k31cnha0i9rznh8j4flbrv9vcaymfn7r834l3"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-convertdate" ,python-convertdate)
        ("python-dateutil" ,python-dateutil)
        ("python-korean-lunar-calendar"
         ,python-korean-lunar-calendar)
        ("python-six" ,python-six)))
    (home-page
      "https://github.com/dr-prodigy/python-holidays")
    (synopsis
      "Generate and work with holidays in Python")
    (description
      "Generate and work with holidays in Python")
    (license license:expat)))

(define-public python-aiofiles
  (package
    (name "python-aiofiles")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "aiofiles" version))
        (sha256
          (base32
            "14m01kjxm2j7zyljjj6xlhlgygcsriymbx730gc5jp9xglaina70"))))
    (build-system python-build-system)
    (home-page "https://github.com/Tinche/aiofiles")
    (synopsis "File support for asyncio.")
    (description "File support for asyncio.")
    (license license:asl2.0)))
