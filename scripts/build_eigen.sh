#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


if [ -f "eigen-3.3.9.tar.bz2" ];then
    echo "eigen-3.3.9.tar.bz2 is exist"
else
    wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.bz2
fi


if [ -d "eigen-3.3.9" ];then
    echo "eigen-3.3.9 is exist"
else
    tar xvhf  eigen-3.3.9.tar.bz2  
fi




#wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.bz2
#tar xvhf eigen-3.3.9.tar.bz2 
#rm 3.3.9.tar.bz2

cd eigen-3.3.9
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release    -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake ..
make
make install
cd ${DIR}
