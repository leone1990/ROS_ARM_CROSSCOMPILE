#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build

if [ -d "yaml-cpp" ];then
    echo "yaml-cpp is exist"
else
    git clone https://github.com/jbeder/yaml-cpp.git
fi


#git clone https://github.com/jbeder/yaml-cpp.git

cd yaml-cpp
mkdir build
cd build
cmake   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DBUILD_SHARED_LIBS=1 ..
make
make install
cd ${DIR}
