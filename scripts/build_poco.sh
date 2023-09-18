#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build

if [ -f "poco-1.8.0.1.tar.gz" ];then
    echo "poco-1.8.0.1.tar.gz is exist"
else
    wget https://pocoproject.org/releases/poco-1.8.0.1/poco-1.8.0.1.tar.gz
fi


if [ -d "poco-1.8.0.1" ];then
    echo "poco-1.8.0.1 is exist"
else
    tar -zxvf poco-1.8.0.1.tar.gz
fi


#wget https://pocoproject.org/releases/poco-1.8.0.1/poco-1.8.0.1.tar.gz
#unzip poco-1.8.0.1.zip
#rm poco-1.8.0.1.tar.gz

cd poco-1.8.0.1
mkdir build
cd build
cmake     -DCMAKE_BUILD_TYPE=Release   -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake  -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux   ..

make -j4
make install
cd ${DIR}
