#File rostoolchain.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_C_COMPILER /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-g++)

#set(CMAKE_C_FLAGS "-fPIC"  "-fopenmp"  CACHE STRING "compile flags" FORCE)
#set(CMAKE_CXX_FLAGS "-fPIC" "-fopenmp"  CACHE STRING "compile flags" FORCE)

 set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall   -fPIC -pthread   -O3 -fopenmp")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -fPIC -pthread -O3 -fopenmp")


set(CMAKE_FIND_ROOT_PATH ${CROSS_ROOT})
set(CATKIN_WS_ROOT ${CROSS_ROOT}/noetic)
#set(COMPILER_ROOT /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu)

# Have to set this one to BOTH, to allow CMake to find rospack
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(PYTHON_EXECUTABLE /usr/bin/python)
set(CMAKE_CROSSCOMPILING true)
set(CMAKE_PREFIX_PATH ${CATKIN_WS_ROOT}/devel ${COMPILER_ROOT} ${CROSS_ROOT}/arm-linux)
#set(LD_LIBRARY_PATH ${CATKIN_WS_ROOT}/devel  /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/arm-linux/lib)   
#set(LD_LIBRARY_PATH ${CROSS_ROOT}/arm-linux/lib)   
set(CATKIN_ENABLE_TESTING false)
set(EIGEN3_DIR ${CROSS_ROOT}/arm-linux)
set(EIGEN3_INCLUDE_DIR ${CROSS_ROOT}/arm-linux/include/eigen3)
set(EIGEN_INCLUDE_DIR ${CROSS_ROOT}/arm-linux/include/eigen3)

#set(PCL_DIR /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/arm-linux/share/pcl-1.8)


#set(TinyXML_ROOT_DIR ${CROSS_ROOT}/arm-linux)
#set(TinyXML_INCLUDE_DIR ${CROSS_ROOT}/arm-linux/include)

add_definitions(-DTIXML_USE_STL)


#link_directories(
# /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/arm-linux/lib
 #/home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/aarch64-linux-gnu/lib64
#)
#SET(FLANN_ROOT /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/arm_linux)
#SET(CHOLMODDIR /home/leone/cross_compile/ROS_ARM_CROSSCOMPILE/arm_linux)

