#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build




if [ -f "v8.0.1.zip" ];then
    echo "v8.0.1.zip is exist"
else
    wget https://github.com/qhull/qhull/archive/refs/tags/v8.0.1.zip
fi


if [ -d "qhull-8.0.1" ];then
    echo "qhull-8.0.1 is exist"
else
    unzip v8.0.1.zip 
fi

#wget https://github.com/qhull/qhull/archive/refs/tags/v8.0.1.zip
#unzip v8.0.1.zip

cd qhull-8.0.1

mkdir build
cd build
#cmake  -DCMAKE_BUILD_TYPE=Release    -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
cmake  -DCMAKE_BUILD_TYPE=Release    -DBUILD_STATIC_LIBS=OFF  -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make -j4
make install
cd ${DIR}
