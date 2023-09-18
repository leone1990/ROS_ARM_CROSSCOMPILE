#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


if [ -f "3.4.16.zip" ];then
    echo "3.4.16.zip is exist"
else
    wget https://github.com/opencv/opencv/archive/refs/tags/3.4.16.zip
fi


if [ -d "opencv-3.4.16" ];then
    echo "opencv-3.4.16 is exist"
else
    unzip  3.4.16.zip 
fi




#wget https://github.com/opencv/opencv/archive/refs/tags/3.4.16.zip

#unzip  3.4.16.zip

cd opencv-3.4.16

mkdir build
cd build
#cmake  -DCMAKE_BUILD_TYPE=Release    -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
cmake  -DCMAKE_BUILD_TYPE=Release    -DWITH_JPEG=OFF  -DWITH_PNG=OFF  -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make -j4
make install
cd ${DIR}
