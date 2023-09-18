#! /bin/bash
echo "Installing boost 1.71"
DIR=`pwd`
echo "The present working directory is `pwd`"
export C_INCLUDE_PATH=${DIR}/arm-linux/include/python3.8
export CPLUS_INCLUDE_PATH=${DIR}/arm-linux/include/python3.8
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
#wget https://github.com/boostorg/boost/archive/refs/tags/boost-1.71.0.zip

cc_compiler=$(sed  -n  '/CMAKE_C_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cc_compiler=$(echo "$cc_compiler" | awk '{print $2}')
cc_compiler=$(echo ${cc_compiler%)*}) 
 
cxx_compiler=$(sed  -n  '/CMAKE_CXX_COMPILER/p'   ${DIR}/arm-toolchain.cmake)
cxx_compiler=$(echo "$cxx_compiler" | awk '{print $2}')
cxx_compiler=$(echo ${cxx_compiler%)*}) 

host_value=$(echo ${cc_compiler#*bin/})
host_value=$(echo ${host_value%-gnu*})            


if [ -f "boost_1_71_0.zip" ];then
    echo "boost_1_71_0.zip is exist"
else
    wget https://boostorg.jfrog.io/artifactory/main/release/1.71.0/source/boost_1_71_0.zip
fi


if [ -d "boost_1_71_0" ];then
    echo "boost_1_71_0 is exist"
    cd boost_1_71_0
else
    unzip  boost_1_71_0.zip
    cd boost_1_71_0
    ./bootstrap.sh 

    sed -i '10,24d' project-config.jam 
    echo "if ! gcc in [ feature.values <toolset> ] { using gcc : : ${cc_compiler} ; }" >> project-config.jam
    echo "import python ; if ! [ python.configured ] { using python : 3.8 : ${DIR}/arm-linux/bin/python3.8 : ${DIR}/arm-linux/include/python3.8 : ${DIR}/arm-linux/lib ; }" >> project-config.jam

    
fi




#wget https://boostorg.jfrog.io/artifactory/main/release/1.71.0/source/boost_1_71_0.zip

#unzip  boost_1_71_0.zip


#cd boost_1_71_0





./b2 install  --prefix=${DIR}/arm-linux
#./b2 install  cxxflags=-fPIC cflags=-fPIC   --prefix=${DIR}/arm-linux
#./b2 install toolset=gcc-arm --with-python --prefix=${DIR}/arm-linux


cd ${DIR}
