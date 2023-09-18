#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
#wget https://github.com/opencv/opencv/archive/refs/tags/3.4.16.zip
#tar -zxvf  opencv-3.4.16.tar.gz
unzip glog.zip

cd glog

mkdir build
cd build
#cmake  -DCMAKE_BUILD_TYPE=Release    -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
cmake  -DCMAKE_BUILD_TYPE=Release    -DWITH_JPEG=OFF  -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make -j4
make install
cd ${DIR}
