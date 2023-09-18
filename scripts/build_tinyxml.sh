#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


if [ -d "tinyxml" ];then
    echo "tinyxml is exist"
    cd tinyxml
else
    git clone https://github.com/vmayoral/tinyxml
    cd tinyxml
    sed -i '18,30d' CMakeLists.txt
fi


#git clone https://github.com/vmayoral/tinyxml

#unzip tinyxml.zip

#wget https://gist.githubusercontent.com/TNick/7960323/raw/3046ecda1d4d54d777c407f43ac357846a192e05/TinyXML-CmakeLists.txt -O CMakeLists.txt
mkdir build
cd build
cmake  -DCMAKE_BUILD_TYPE=Release    -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_CXX_FLAGS=-fPIC ..
make
cp libtinyxml.a ${DIR}/arm-linux/lib/
cp ../tinystr.h ${DIR}/arm-linux/include/
cd ${DIR}
