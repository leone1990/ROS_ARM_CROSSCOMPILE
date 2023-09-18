#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


if [ -f "1.8.5.zip" ];then
    echo "1.8.5.zip is exist"
else
    wget https://github.com/flann-lib/flann/archive/refs/tags/1.8.5.zip
fi


if [ -d "flann-1.8.5" ];then
    echo "flann-1.8.5 is exist"
    cd flann-1.8.5
else
    unzip 1.8.5.zip  
    cd flann-1.8.5
    touch src/cpp/empty.cpp
    sed -e '/add_library(flann_cpp SHARED/ s/""/empty.cpp/' -e '/add_library(flann SHARED/ s/""/empty.cpp/' -i src/cpp/CMakeLists.txt
fi



mkdir build
cd build
cmake   -DCMAKE_BUILD_TYPE=Release   -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_MATLAB_BINDINGS=OFF -DBUILD_PYTHON_BINDINGS=OFF   -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake  -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux    ..
make -j4
make install
cd ${DIR}
