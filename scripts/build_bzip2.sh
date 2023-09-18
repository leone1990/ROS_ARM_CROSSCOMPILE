#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
#git clone	https://github.com/enthought/bzip2-1.0.6.git

cc_compiler=$(sed  -n  '/CMAKE_C_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cc_compiler=$(echo "$cc_compiler" | awk '{print $2}')
cc_compiler=$(echo ${cc_compiler%)*}) 
 
cxx_compiler=$(sed  -n  '/CMAKE_CXX_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cxx_compiler=$(echo "$cxx_compiler" | awk '{print $2}')
cxx_compiler=$(echo ${cxx_compiler%)*}) 

host_value=$(echo ${cc_compiler#*bin/})
host_value=$(echo ${host_value%-gnu*})            



if [ -d "bzip2" ];then
    echo "bzip2 is exist"
else
    git clone  https://gitlab.com/federicomenaquintero/bzip2
    
fi


cd bzip2

#git clone  https://gitlab.com/federicomenaquintero/bzip2

#cd bzip2
mkdir build
cd build
cmake  -DCMAKE_BUILD_TYPE=Release   -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux ..
make -j4
make install
#unzip bzip2-1.0.6.zip

#cd bzip2-1.0.6

#make install CC=${cc_compiler}  CFLAGS=-fPIC PREFIX=${DIR}/arm-linux

cd ${DIR}
