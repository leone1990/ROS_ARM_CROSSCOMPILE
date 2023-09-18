#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
#wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tar.xz
tar xvf Python-3.9.2.tar.xz
#rm Python-2.7.3.tar.xz
cd Python-3.9.2

cc_compiler=$(sed  -n  '/CMAKE_C_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cc_compiler=$(echo "$cc_compiler" | awk '{print $2}')
cc_compiler=$(echo ${cc_compiler%)*}) 
 
cxx_compiler=$(sed  -n  '/CMAKE_CXX_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cxx_compiler=$(echo "$cxx_compiler" | awk '{print $2}')
cxx_compiler=$(echo ${cxx_compiler%)*}) 

host_value=$(echo ${cc_compiler#*bin/})
host_value=$(echo ${host_value%-gcc*})            




make python Parser/pgen
mv python hostpython
mv Parser/pgen Parser/hostpgen
make distclean
#patch -p1 < Python-3.8.10-xcompile.patch
#./configure  CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ AR=aarch64-linux-gnu-ar RANLIB=aarch64-linux-gnu-ranlib CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure --host=arm-linux --build=x86_64-linux-gnu --prefix=${DIR}/arm-linux --enable-shared

./configure --prefix=${DIR}/arm-linux --host=${host_value} --build=x86  --without-ensurepip     --enable-optimizations    CC=${cc_compiler}    LDFLAGS=-L${DIR}/arm-linux/lib CPPFLAGS=-I${DIR}/arm-linux/include       CFLAGS=-fPIC  ac_cv_buggy_getaddrinfo=no    ac_cv_file__dev_ptmx=yes     ac_cv_file__dev_ptc=no


make -j4
make install 
cd ${DIR}
