#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Ensure execution as root
if [ "$EUID" -gt 0 ]
then
    echo "ERROR: This script must be run as root"
    exit
fi

remove_debian_packages() {
    echo -e "Removing installed packages..."
}

remove_resources() {
    echo -e "Removing installed resources (Gtk+, Icon, Cursor, etc)..."
    rm -Rf /usr/share/themes/California/    
    rm -Rf /usr/share/icons/Cocoa/
    rm -Rf /usr/share/icons/Rainbow/
    rm -Rf /usr/share/fonts/SF/
    fc-cache -f
    rm -Rf /usr/bin/com.github.libredeb.lightpad
    rm -Rf /usr/share/lightpad/application.css
    rm -Rf /usr/share/icons/hicolor/24x24/apps/lightpad.svg
    rm -Rf /usr/share/icons/hicolor/32x32/apps/lightpad.svg
    rm -Rf /usr/share/icons/hicolor/48x48/apps/lightpad.svg
    rm -Rf /usr/share/icons/hicolor/64x64/apps/lightpad.svg
    rm -Rf /usr/share/icons/hicolor/128x128/apps/lightpad.svg
    rm -Rf /usr/share/applications/com.github.libredeb.lightpad.desktop
    rm -Rf /usr/share/metainfo/com.github.libredeb.lightpad.appdata.xml
}


remove_debian_packages
remove_resources
