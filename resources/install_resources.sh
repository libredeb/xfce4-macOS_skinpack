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
    apt-get update
    apt-get install gtk2-engines-murrine gtk2-engines-pixbuf gnome-icon-theme plank catfish appmenu-gtk2-module appmenu-gtk3-module appmenu-qt xfce4-appmenu-plugin xfce4-notifyd meson ninja-build libgee-0.8-dev libgnome-menu-3-dev cdbs valac git libvala-0.42-dev libglib2.0-dev libwnck-3-dev libgtk-3-dev xterm python3 python3-wheel python3-setuptools gnome-menus
}

install_and_compile_lightpad() {
    git clone https://github.com/libredeb/lightpad.git /tmp/lightpad
    cd /tmp/lightpad
    meson build --prefix=/usr
    cd build
    ninja
    sudo ninja install
    rm -Rf /tmp/lightpad
}

install_gtk_themes() {
    echo -e "Installing Gtk+ themes..."
    mv resources/Gtk/California/ /usr/share/themes/
    chown root:root -R /usr/share/themes/California/
}

install_icon_themes() {
    echo -e "Installing cursor and icon themes..."
    mv resources/icons/Cocoa/ /usr/share/icons/
    mv resources/icons/Rainbow/ /usr/share/icons/
    chown root:root -R /usr/share/icons/Cocoa/
    chown root:root -R /usr/share/icons/Rainbow/
    gtk-update-icon-cache -f /usr/share/icons/Cocoa/
}

install_fonts() {
    echo -e "Installing fonts..."
    mv resources/fonts/SF/ /usr/share/fonts/
    chown root:root -R /usr/share/fonts/SF/
    fc-cache -f
}

install_debian_packages
install_and_compile_lightpad
install_gtk_themes
install_icon_themes
install_fonts
