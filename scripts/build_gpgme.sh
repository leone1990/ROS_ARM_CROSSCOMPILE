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

if [ -f "gpgme-1.22.0.tar.bz2" ];then
    echo "gpgme-1.22.0.tar.bz2 is exist"
else
    wget https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.22.0.tar.bz2
fi


if [ -d "gpgme-1.22.0" ];then
    echo "gpgme-1.22.0 is exist"
else
    tar -jxvf gpgme-1.22.0.tar.bz2 
fi


#wget https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.22.0.tar.bz2
#tar -jxvf gpgme-1.22.0.tar.bz2

cd gpgme-1.22.0

./configure  --prefix=${DIR}/arm-linux CC=${cc_compiler} CXX=${cxx_compiler}   CXXFLAGS=-fPIC CFLAGS=-fPIC   LDFLAGS=-L${DIR}/arm-linux/lib CPPFLAGS=-I${DIR}/arm-linux/include   --host=arm
make
make install
cd ${DIR}
