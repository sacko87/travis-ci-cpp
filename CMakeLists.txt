cmake_minimum_required(VERSION 2.8)
project(travis-ci-cpp)

enable_testing()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

add_executable(travis-ci-cpp main.cpp)

find_package(Tesseract REQUIRED)

target_link_libraries(travis-ci-cpp ${Tesseract_LIBRARIES})
target_include_directories(travis-ci-cpp PUBLIC ${Tesseract_INCLUDE_DIRS})

add_test(NAME run COMMAND ./travis-ci-cpp)

install(TARGETS travis-ci-cpp DESTINATION bin)
