用于树莓派交叉编译ROS环境

raspberry pi 交叉编译工具链下载，选择合适自己系统的版本:

https://github.com/abhiTronix/raspberry-pi-cross-compilers


环境变量修改,例如：

   arm-toolchain.cmake文件中，修改交叉编译路径：
   SET(CMAKE_C_COMPILER /PATH/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-gcc)
   SET(CMAKE_CXX_COMPILER /PATH/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-g++)

   noetic文件加下，rostoolchain.cmake中， 修改交叉编译路径：
   SET(CMAKE_C_COMPILER /PATH/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-gcc)
   SET(CMAKE_CXX_COMPILER /PATH/ROS_ARM_CROSSCOMPILE/cross-pi-gcc-10.3.0-64/bin/aarch64-linux-gnu-g++)

编译：
   
  1.编译依赖库 
  cd  ROS_ARM_CROSSCOMPILE
  source scripts/build_dependencies.sh 

  2.编译ROS
  cd ros_noetic
   
  ./src/catkin/bin/catkin_make    -DCMAKE_TOOLCHAIN_FILE=/PATH/ROS_ARM_CROSSCOMPILE/ros_noetic/rostoolchain.cmake  -DCMAKE_BUILD_TYPE=Release -DCROSS_ROOT=/PATH/ROS_ARM_CROSSCOMPILE
  ./src/catkin/bin/catkin_make install
  

运行：
  1.将生成的arm-linux,和ros_noetic下的install文件拷贝到目标设备中
  2.添加库路径:export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/PATH/arm-linux
  3.source install/setup.bash
  4.运行roscore
  
roscore运行会报缺少python库，需要安装几个依赖：    

rpi:

$ sudo apt-get install python3-rospkg python3-defusedxml python3-netifaces  python3-pycryptodome python3-gnupg

