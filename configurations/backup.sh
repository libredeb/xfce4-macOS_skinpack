#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with root user"
    exit
fi

mkdir $1/.skinpack
cp -R $1/.config/xfce4/panel $1/.skinpack/
cp -R $1/.config/xfce4/xfconf $1/.skinpack/
