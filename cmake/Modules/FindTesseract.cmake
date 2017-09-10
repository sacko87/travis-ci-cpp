include(LibFindMacros)

libfind_package(Leptonica Leptonica)

libfind_pkg_check_modules(Tesseract_PKGCONF tesseract)

find_path(Tesseract_INCLUDE_DIR
  NAMES tesseract/baseapi.h
  PATHS ${Tesseract_PKGCONF_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH}
)

find_library(Tesseract_LIBRARY
  NAMES tesseract
  PATHS ${Tesseract_PKGCONF_LIBRARY_DIRS} ${CMAKE_LIBRARY_PATH}
)

set(Tesseract_PROCESS_INCLUDES Tesseract_INCLUDE_DIR Leptonica_INCLUDE_DIR)
set(Tesseract_PROCESS_LIBS Tesseract_LIBRARY Leptonica_LIBRARY)

libfind_process(Tesseract)
