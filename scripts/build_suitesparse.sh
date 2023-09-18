#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
#wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip

cd SuiteSparse
cd SuiteSparse_config
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux   -DCROSS_ROOT=/home/leone/cross_compile/ROS_ARM_CROSSCOMPILE  ..
make

cd ../..

cd COLAMD
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make

cd ../..
cd AMD
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make

cd ../..
cd CHOLMOD
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make




#make install
cd ${DIR}
