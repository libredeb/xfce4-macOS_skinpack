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
}


remove_debian_packages
remove_resources
