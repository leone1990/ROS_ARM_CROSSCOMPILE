#! /bin/bash
DIR=`pwd`
echo "The present working directory is `pwd`"
mkdir -p build
mkdir -p arm-linux/bin
mkdir -p arm-linux/lib
mkdir -p arm-linux/include
cd build
wget http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.3.0.tar.gz
tar xzvf libjpeg-turbo-1.3.0.tar.gz
rm libjpeg-turbo-1.3.0.tar.gz
cd libjpeg-turbo-1.3.0
 ./configure --host=aarch64-linux-gnu CC=aarch64-linux-gnu-gcc AR=aarch64-linux-gnu-ar STRIP=aarch64-linux-gnu-strip RANLIB=aarch64-linux-gnu-ranlib --prefix=${DIR}/arm-linux CFLAGS=-fPIC CXXFLAGS=-fPIC
make
make install
cd ${DIR}
