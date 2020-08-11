#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with root user"
    exit
fi

xfconf-query -c xfwm4 -p /general/theme -s California
xfconf-query -c xsettings -p /Net/ThemeName -s California
xfconf-query -c xfwm4 -p /general/title_alignment -s center
xfconf-query -c xfwm4 -p /general/button_layout -s "CHM|"
xfconf-query -c xsettings -p /Net/IconThemeName -s Cocoa
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Rainbow
xfconf-query -c xfwm4 -p /general/title_font -s "SF Pro Display 11"
xfconf-query -c xsettings -p /Gtk/FontName -s "SF Pro Display 11"
