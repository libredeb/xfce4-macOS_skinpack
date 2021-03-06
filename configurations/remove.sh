#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with root user"
    exit
fi

rm -Rf $1/.config/xfce4/panel
rm -Rf $1/.config/xfce4/xfconf
cp -R $1/.skinpack/panel $1/.config/xfce4/
cp -R $1/.skinpack/xfconf $1/.config/xfce4/
