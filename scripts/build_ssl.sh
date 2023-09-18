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
 


cross_compile=$(echo ${cc_compiler%gcc*})            



if [ -f "OpenSSL_1_1_1v.zip" ];then
    echo "OpenSSL_1_1_1v.zip is exist"
else
    wget https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1v.zip
fi


if [ -d "openssl-OpenSSL_1_1_1v" ];then
    echo "openssl-OpenSSL_1_1_1v is exist"
else
    unzip  OpenSSL_1_1_1v.zip
fi


cd openssl-OpenSSL_1_1_1v


#./config no-asm --prefix=${DIR}/arm-linux --cross-compile-prefix=/usr/bin/aarch64-linux-gnu-
./config no-asm --prefix=${DIR}/arm-linux --cross-compile-prefix=${cross_compile}
sed -i 's/-m64//g'  Makefile 

make
make install
cd ${DIR}
