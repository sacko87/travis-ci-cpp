include(LibFindMacros)

libfind_package(OpenCV Tesseract)

libfind_pkg_check_modules(OpenCV_PKGCONF opencv)

if(NOT OpenCV_FIND_COMPONENTS)
  set(OpenCV_FIND_COMPONENTS core)
endif(NOT OpenCV_FIND_COMPONENTS)

foreach(NAME ${OpenCV_FIND_COMPONENTS})
  # get the module header file
  find_path(OpenCV_${NAME}_INCLUDE_DIR
    NAMES opencv2/${NAME}/${NAME}.hpp
    PATHS ${OpenCV_PKGCONF_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH}
  )

  # get the module library file
  find_library(OpenCV_${NAME}_LIBRARY
    NAMES opencv_${NAME}
    PATHS ${OpenCV_PKGCONF_LIBRARY_DIRS} ${CMAKE_LIBRARY_PATH}
  )

  # did we find both the library and their respective include directory?
  if(OpenCV_${NAME}_LIBRARY AND OpenCV_${NAME}_INCLUDE_DIR)
    # retain the include directory and the library for libfind_process()
    list(APPEND OpenCV_PROCESS_INCLUDES OpenCV_${NAME}_INCLUDE_DIR)
    list(APPEND OpenCV_PROCESS_LIBS OpenCV_${NAME}_LIBRARY)
  elseif(NOT OpenCV_${NAME}_INCLUDE_DIR)
    message(FATAL_ERROR "Could not find the header file: opencv2/${NAME}/${NAME}.hpp")
  else()
    message(FATAL_ERROR "Could not find the library: libopencv_${NAME}.")
  endif(OpenCV_${NAME}_LIBRARY AND OpenCV_${NAME}_INCLUDE_DIR)
endforeach(NAME)

libfind_process(OpenCV)
