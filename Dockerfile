FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND=noninteractive
# if we want to change the GCC compiler
#RUN apt-get -yq update -qq && apt-get install -yq software-properties-common
#RUN add-apt-repository -y "ppa:ubuntu-toolchain-t/test"
RUN apt-get -yq update && \
    apt-get -yq install libtesseract-dev libleptonica-dev cmake g++

COPY . /root
WORKDIR /root

RUN mkdir build && cd build && cmake .. && make -j VERBOSE=1 && ARGS=-V make test

ENTRYPOINT ./build/travis-ci-cpp
