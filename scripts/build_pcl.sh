#!/bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build


if [ -f "pcl-1.8.1.zip" ];then
    echo "pcl-1.8.1.zip is exist"
else
    wget https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.8.1.zip
fi


if [ -d "pcl-pcl-1.8.1" ];then
    echo "pcl-pcl-1.8.1 is exist"
    cd pcl-pcl-1.8.1
else
    unzip  pcl-1.8.1.zip 
    cd pcl-pcl-1.8.1
    sed -i '20,25d' cmake/Modules/FindFLANN.cmake # 删除20到25行
fi




#wget https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.8.1.zip
#unzip  pcl-1.8.1.zip


#sed -i '21iset(QHULL_RELEASE_NAME qhull qhull_p qhull_r)'  cmake/Modules/FindQhull.cmake

mkdir build
cd build
cmake   -DWITH_QT=OFF    -DWITH_VTK=OFF   -DWITH_OPENNI=OFF  -DWITH_OPENNI2=OFF  -DBUILD_tools=ON   -DWITH_PCAP=OFF -DWITH_LIBUSB=OFF -DWITH_OPENGL=OFF -DWITH_PNG=OFF    -DCMAKE_BUILD_TYPE=Release    -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake  -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux   -DBUILD_MATLAB_BINDINGS=OFF      LDFLAGS=-L${DIR}/arm-linux/lib CPPFLAGS=-I${DIR}/arm-linux/include         ..

cmake   -DWITH_QT=OFF    -DWITH_VTK=OFF   -DWITH_OPENNI=OFF  -DWITH_OPENNI2=OFF  -DBUILD_tools=ON   -DWITH_PCAP=OFF -DWITH_LIBUSB=OFF -DWITH_OPENGL=OFF -DWITH_PNG=OFF    -DCMAKE_BUILD_TYPE=Release    -DCMAKE_TOOLCHAIN_FILE=${DIR}/arm-toolchain.cmake  -DCMAKE_INSTALL_PREFIX=${DIR}/arm-linux   -DBUILD_MATLAB_BINDINGS=OFF       LDFLAGS=-L${DIR}/arm-linux/lib CPPFLAGS=-I${DIR}/arm-linux/include           ..

make -j8
make install
cd ${DIR}
