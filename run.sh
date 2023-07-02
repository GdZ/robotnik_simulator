#!/bin/bash

# environment
source devel/setup.bash

# running
roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui_xl robot_xacro:=rbvogui_xl_std.urdf.xacro use_gpu:=false

