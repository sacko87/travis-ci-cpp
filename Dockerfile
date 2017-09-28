FROM ubuntu:16.04

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get -yq update && \
    apt-get -yq install libtesseract-dev libleptonica-dev libopencv-dev cmake g++ git pkg-config && \
    apt-get clean

COPY main.cpp CMakeLists.txt README.md LICENSE /root/
COPY cmake /root/cmake
WORKDIR /root

RUN mkdir build && cd build && cmake .. && make -j VERBOSE=1 && ARGS=-V make test

ENTRYPOINT ./build/travis-ci-cpp
