#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Ensure execution as root
if [ "$EUID" -gt 0 ]
then
    echo "ERROR: This script must be run as root"
    exit
fi

install_debian_packages() {
    echo -e "Installing required packages..."
    apt-get install gtk2-engines-murrine gtk2-engines-pixbuf gnome-icon-theme
}

install_gtk_themes() {
    echo -e "Installing Gtk+ themes..."
    mv Gtk/California/ /usr/share/themes/
    chown root:root -R /usr/share/themes/California/
}

install_icon_themes() {
    echo -e "Installing cursor and icon themes..."
    mv icons/Cocoa/ /usr/share/icons/
    mv icons/Rainbow/ /usr/share/icons/
    chown root:root -R /usr/share/icons/Cocoa/
    chown root:root -R /usr/share/icons/Rainbow/
    gtk-update-icon-cache -f /usr/share/icons/Cocoa/
}

install_fonts() {
    echo -e "Installing fonts..."
    mv fonts/SF/ /usr/share/fonts/
    chown root:root -R /usr/share/fonts/SF/
    fc-cache -f
}

install_debian_packages
install_gtk_themes
install_icon_themes
install_fonts
