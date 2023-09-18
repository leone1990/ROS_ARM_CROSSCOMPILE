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






if [ -f "libgpg-error-1.47.tar.bz2" ];then
    echo "libgpg-error-1.47.tar.bz2 is exist"
else
    wget  https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.47.tar.bz2
fi


if [ -d "libgpg-error-1.47" ];then
    echo "libgpg-error-1.47 is exist"
else
    tar -jxvf libgpg-error-1.47.tar.bz2   
fi

cd libgpg-error-1.47
#wget  https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.47.tar.bz2
#tar -jxvf   libgpg-error-1.47.tar.bz2

#cd libgpg-error-1.47






./autogen.sh
./configure  --enable-maintainer-mode  --prefix=${DIR}/arm-linux CC=${cc_compiler} CXX=${cxx_compiler} --host=${host_value}
make
make install
cd ${DIR}
