#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with root user"
    exit
fi

# Make sure that the apps that make up the interface are not running
#pkill plank
#pkill xfce4-panel

# Remove old Configurations
#rm -Rf $1/.gtkrc-2.0
#rm -Rf $1/.config/gtk-3.0/gtk.css
#rm -Rf $1/.config/xfce4/panel
#rm -Rf $1/.config/xfce4/xfconf

# Apply new settings
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true

#cp -R configurations/panel $1/.config/xfce4
#cp -R configurations/xfconf $1/.config/xfce4
find $1/.config/xfce4/panel -type d -exec chmod 755 {} \;
find $1/.config/xfce4/panel -type f -exec chmod 644 {} \;
find $1/.config/xfce4/xfconf -type d -exec chmod 755 {} \;
find $1/.config/xfce4/xfconf -type f -exec chmod 644 {} \;
chown -R $2:$2 $1/.config/xfce4/panel
chown -R $2:$2 $1/.config/xfce4/xfconf

xfconf-query -c xfwm4 -p /general/theme -s California
xfconf-query -c xsettings -p /Net/ThemeName -s California
xfconf-query -c xfwm4 -p /general/title_alignment -s center
xfconf-query -c xfwm4 -p /general/button_layout -s "CHM|"
xfconf-query -c xsettings -p /Net/IconThemeName -s Cocoa
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Rainbow
xfconf-query -c xfwm4 -p /general/title_font -s "SF Pro Display 11"
xfconf-query -c xsettings -p /Gtk/FontName -s "SF Pro Display 11"
