#!/bin/bash
# open vnc
# tigervncserver -kill :1
# tigervncserver -xstartup /usr/bin/gnome-session -geometry 1280x960 -localhost no :1
if [[ -e env.sh ]];
then
    source env.sh
else
    export DISPLAY=:0
fi

# open novnc
# pkill websockify
# websockify -D --web=/usr/share/novnc/ --cert=./novnc.pem 6080 localhost:5901

# running
roslaunch rbvogui_sim_bringup rbvogui_complete.launch robot_model:=rbvogui_xl robot_xacro:=rbvogui_xl_std.urdf.xacro use_gpu:=false

# close vnc
# tigervncserver -kill :1
# pkill websockify
