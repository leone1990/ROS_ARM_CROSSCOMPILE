#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build

#git clone https://github.com/akemimadoka/libuuid


if [ -f "libuuid-1.0.3.tar.gz" ];then
    echo "libuuid-1.0.3.tar.gz is exist"
else
    wget -O  libuuid-1.0.3.tar.gz   https://sourceforge.net/projects/libuuid/files/latest/download
fi


if [ -d "libuuid-1.0.3" ];then
    echo "libuuid-1.0.3 is exist"
else
    tar -xvzf libuuid-1.0.3.tar.gz 
fi


cd libuuid-1.0.3





./configure --prefix=${DIR}/arm-linux --host=${host_value} --build=x86  CC=${cc_compiler}  CFLAGS=-fPIC  

#mkdir build
#cd build

#cmake  -DCMAKE_BUILD_TYPE=Release   -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..


make -j4

make install

cd ${DIR}
