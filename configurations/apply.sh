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
pkill plank
pkill xfce4-panel

# Remove old Configurations
rm -Rf $1/.gtkrc-2.0
rm -Rf $1/.config/gtk-3.0/gtk.css
rm -Rf $1/.config/xfce4/panel
rm -Rf $1/.config/xfce4/xfconf
rm -Rf $1/.config/plank/dock1/*
mkdir -p $1/.config/plank/dock1/

# Apply new settings
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/Modules -n -t string -s "appmenu-gtk-module"
echo "#xfce4-power-manager-plugin * { -gtk-icon-transform: scale(1.2); }" >> $1/.config/gtk-3.0/gtk.css

cp -R resources/plank/dock1/launchers $1/.config/plank/dock1/
cp -R configurations/xfce4/panel $1/.config/xfce4
cp -R configurations/xfce4/xfconf $1/.config/xfce4
chmod 755 $1/.config/plank/dock1/launchers
chmod 644 $1/.config/plank/dock1/launchers/*.dockitem
chown -R $2:$2 $1/.config/plank/dock1/
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
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/Catalina.jpg
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ theme California
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ dock-items "['Thunar.dockitem', 'com.github.libredeb.lightpad.dockitem', 'org.gnome.Epiphany.dockitem', 'org.gnome.Maps.dockitem', 'shotwell.dockitem', 'org.gnome.Calendar.dockitem', 'org.gnome.gedit.dockitem', 'rhythmbox.dockitem', 'org.gnome.Software.dockitem', 'xfce-settings-manager.dockitem']"

