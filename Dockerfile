FROM ubuntu:19.04

# Dockerfile for building UEFI version of bareflank

RUN apt update 
RUN apt -y install git build-essential nasm clang libelf-dev cmake xxd

COPY . /hypervisor
RUN mkdir build
WORKDIR build
RUN cmake -DENABLE_BUILD_EFI=ON /hypervisor && make -j4
