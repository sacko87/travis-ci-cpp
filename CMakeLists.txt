cmake_minimum_required(VERSION 2.6)
project(travis-ci-cpp)

add_executable(travis-ci-cpp main.cpp)

# https://stackoverflow.com/a/29316084
find_package(PkgConfig REQUIRED)
pkg_search_module(TESS REQUIRED tesseract)

target_link_libraries(travis-ci-cpp ${TESS_LIBRARIES})
target_include_directories(travis-ci-cpp PUBLIC ${TESS_INCLUDE_DIRS})
target_compile_options(travis-ci-cpp PUBLIC ${TESS_CFLAGS_OTHER})

install(TARGETS travis-ci-cpp DESTINATION bin)
