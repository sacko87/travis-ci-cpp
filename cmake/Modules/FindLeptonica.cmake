include(LibFindMacros)

libfind_pkg_check_modules(Leptonica_PKGCONF lept)

find_path(Leptonica_INCLUDE_DIR
  NAMES leptonica/allheaders.h
  PATHS ${Leptonica_PKGCONF_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH}
)

find_library(Leptonica_LIBRARY
  NAMES lept
  PATHS ${Leptonica_PKGCONF_LIBRARY_DIRS} ${CMAKE_LIBRARY_PATH}
)

set(Leptonica_PROCESS_INCLUDES Leptonica_INCLUDE_DIR)
set(Leptonica_PROCESS_LIBS Leptonica_LIBRARY)

libfind_process(Leptonica)
