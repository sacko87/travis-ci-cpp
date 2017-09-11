cmake_minimum_required(VERSION 2.8)
project(travis-ci-cpp CXX)

#include(CheckCXXCompilerFlag)

#function(enable_cxx_compiler_flag_if_supported flag)
#    string(FIND "${CMAKE_CXX_FLAGS}" "${flag}" flag_already_set)
#    if(flag_already_set EQUAL -1)
#        check_cxx_compiler_flag("${flag}" flag_supported)
#        if(flag_supported)
#            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}" PARENT_SCOPE)
#        endif()
#        unset(flag_supported CACHE)
#    endif()
#endfunction()

#enable_cxx_compiler_flag_if_supported("-Wall")
#enable_cxx_compiler_flag_if_supported("-Wextra")
#enable_cxx_compiler_flag_if_supported("-pedantic")
#enable_cxx_compiler_flag_if_supported("-Werror")

enable_testing()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

add_executable(travis-ci-cpp main.cpp)

find_package(Tesseract REQUIRED)

target_link_libraries(travis-ci-cpp ${Tesseract_LIBRARIES})
target_include_directories(travis-ci-cpp PUBLIC ${Tesseract_INCLUDE_DIRS})

add_test(NAME run COMMAND ./travis-ci-cpp)

install(TARGETS travis-ci-cpp DESTINATION bin)
