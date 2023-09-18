#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build




if [ -d "tinyxml2" ];then
    echo "tinyxml2 is exist"
else
    git clone https://github.com/leethomason/tinyxml2
fi



#unzip tinyxml2.zip
cd tinyxml2

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release    -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_CXX_FLAGS=-fPIC ..
make
cp libtinyxml2.a ${DIR}/arm-linux/lib/

cp ../tinyxml2.h ${DIR}/arm-linux/include/
cd ${DIR}
