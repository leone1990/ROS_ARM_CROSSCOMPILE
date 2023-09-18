#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


cc_compiler=$(sed  -n  '/CMAKE_C_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cc_compiler=$(echo "$cc_compiler" | awk '{print $2}')
cc_compiler=$(echo ${cc_compiler%)*}) 
 
cxx_compiler=$(sed  -n  '/CMAKE_CXX_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cxx_compiler=$(echo "$cxx_compiler" | awk '{print $2}')
cxx_compiler=$(echo ${cxx_compiler%)*}) 

host_value=$(echo ${cc_compiler#*bin/})
host_value=$(echo ${host_value%-gnu*})        


if [ -f "curl-7.74.0.zip" ];then
    echo "curl-7.74.0.zip is exist"
else
    wget https://curl.se/download/curl-7.74.0.zip
fi


if [ -d "curl-7.74.0" ];then
    echo "curl-7.74.0 is exist"
else
    unzip curl-7.74.0.zip  
fi




#wget https://github.com/curl/curl/archive/refs/tags/curl-7_74_0.zip
#unzip  curl-7.74.0.zip
cd curl-7.74.0

./configure  --prefix=${DIR}/arm-linux CC=${cc_compiler} CXX=${cxx_compiler}   CXXFLAGS=-fPIC  CFLAGS=-fPIC --host=arm

#mkdir build

#cd build
#cmake  -DCMAKE_BUILD_TYPE=Release   -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..

make -j4
make install
cd ${DIR}
