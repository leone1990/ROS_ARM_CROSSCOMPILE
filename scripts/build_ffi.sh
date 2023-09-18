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


if [ -f "v3.4.4.tar.gz" ];then
    echo "v3.4.4.tar.gz is exist"
else
    wget https://github.com/libffi/libffi/archive/refs/tags/v3.4.4.tar.gz
fi


if [ -d "libffi-3.4.4" ];then
    echo "libffi-3.4.4 is exist"
else
    tar -zxvf  v3.4.4.tar.gz  
fi



#wget https://github.com/libffi/libffi/archive/refs/tags/v3.4.4.tar.gz

#tar -zxvf  libffi-3.4.4.tar.gz
cd libffi-3.4.4


./autogen.sh
./configure  --prefix=${DIR}/arm-linux CC=${cc_compiler} CXX=${cxx_compiler} --host=arm
make
make install
cd ${DIR}
