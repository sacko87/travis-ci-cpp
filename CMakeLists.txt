cmake_minimum_required(VERSION 2.8)
project(travis-ci-cpp)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

add_executable(travis-ci-cpp main.cpp)

find_package(Leptonica REQUIRED)

target_link_libraries(travis-ci-cpp ${Leptonica_LIBRARIES})
target_include_directories(travis-ci-cpp PUBLIC ${Leptonica_INCLUDE_DIRS})

install(TARGETS travis-ci-cpp DESTINATION bin)
