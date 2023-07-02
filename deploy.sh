#!/bin/bash

sudo apt install -y python3-vcstool
[[ ! -f /etc/apt/sources.list.d/ros-latest.list ]] && sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list' && wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt update && sudo apt upgrade -y
sudo apt install -y python-catkin-tools
sudo apt install -y ros-melodic-rqt-joint-trajectory-controller
sudo apt install -y ros-melodic-moveit-commander

# import projects
vcs import --input https://raw.githubusercontent.com/RobotnikAutomation/rbvogui_sim/melodic-devel/repos/rbvogui_sim.repos

# install dependencies
rosdep install --from-paths src --ignore-src -y

# install controllers, robotnik_msgs and rccomponent
sudo dpkg -i src/rbvogui_common/libraries/*

# build project
catkin build

# running simulator
# imu, gps, odom
# roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui

# imu, gps, odom, arm
# roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui robot_xacro:=rbvogui_std_ur5.urdf.xacro launch_arm:=true arm_manufacturer:=ur arm_model:=ur5

# moveit
# ROS_NAMESPACE=robot roslaunch rbvogui_ur5_moveit demo.launch

# imu, odom, arm
# roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui robot_xacro:=rbvogui_std_ur5_rg2.urdf.xacro launch_arm:=true arm_manufacturer:=ur arm_model:=ur5 launch_gripper:=true gripper_manufacturer:=onrobot gripper_model:=rg2

# moveit
# ROS_NAMESPACE=robot roslaunch rbvogui_ur5_rg2_moveit demo.launch

# imu, gps, odom, zed/image
# roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui_xl robot_xacro:=rbvogui_xl_std.urdf.xacro use_gpu:=false