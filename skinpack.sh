#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with user \"${USER}\""
    exit
fi

# Script Settings (Global vars)
if [ $HOME ]
then
    USER_HOME=$HOME
elif [ $USER ]
then
    USER_HOME=$( getent passwd "$USER" | cut -d: -f6 )
else
    echo "The user home directory was not found!"
    echo "Please check USER and HOME environment vars"
    exit
fi
