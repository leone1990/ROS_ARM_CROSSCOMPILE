#! /bin/bash
DIR=`pwd`
DIR_NAME=`basename ${DIR}`
if [ $DIR_NAME == ROS_ARM_CROSSCOMPILE ] ; then
  echo "Build dependencies with gcc arm-linux"
  source scripts/build_eigen.sh
  source scripts/build_bzip2.sh
  source scripts/build_console_bridge.sh
  source scripts/build_lz4.sh
  source scripts/build_poco.sh
  source scripts/build_tinyxml.sh
  source scripts/build_tinyxml2.sh
  source scripts/build_uuid.sh
  source scripts/build_ffi.sh
  source scripts/build_python.sh
  source scripts/build_boost.sh
  source scripts/build_opencv3.sh
  source scripts/build_flann.sh
  source scripts/build_qhull.sh
  source scripts/build_pcl.sh
  source scripts/build_ssl.sh
  source scripts/build_curl.sh

  source scripts/build_gpg_error.sh
  source scripts/build_assuan.sh
  source scripts/build_gpgme.sh

  
else
  echo "Run the command from ROS_ARM_CROSSCOMPILE directory"
  echo "Finished with error."
fi
