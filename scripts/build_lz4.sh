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



if [ -d "lz4" ];then
    echo "gpgme-1.22.0 is exist"
else
    git clone https://github.com/lz4/lz4
fi



#git clone https://github.com/lz4/lz4


cd lz4
make CC=${cc_compiler}  CFLAGS=-fPIC
cp lib/lib* ${DIR}/arm-linux/lib/
cp lib/*.h ${DIR}/arm-linux/include/
cd ${DIR}
