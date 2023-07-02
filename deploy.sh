#!/bin/bash

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
roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui_xl robot_xacro:=rbvogui_xl_std.urdf.xacro use_gpu:=false