#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Ensure execution as root
if [ "$EUID" -gt 0 ]
then
    echo "ERROR: This script must be run as root"
    exit
fi

CURRENT_DIR=$PWD

install_debian_packages() {
    echo -e "Installing required packages..."
    apt-get update
    apt-get install gtk2-engines-murrine gtk2-engines-pixbuf gnome-icon-theme plank catfish appmenu-gtk2-module appmenu-gtk3-module appmenu-qt xfce4-appmenu-plugin xfce4-statusnotifier-plugin xfce4-notifyd meson ninja-build libgee-0.8-dev libgnome-menu-3-dev cdbs valac git libvala-0.42-dev libglib2.0-dev libwnck-3-dev libgtk-3-dev xterm python3 python3-wheel python3-setuptools gnome-menus epiphany-browser gnome-maps shotwell gnome-calendar gedit rhythmbox rhythmbox-plugin-alternative-toolbar gnome-software gnome-software-plugin-snap
}

install_and_compile_lightpad() {
    git clone https://github.com/libredeb/lightpad.git /tmp/lightpad
    cd /tmp/lightpad
    meson build --prefix=/usr
    cd build
    ninja
    sudo ninja install
    rm -Rf /tmp/lightpad
    cd $CURRENT_DIR
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
    cp resources/icons/apple-menu.svg /usr/share/pixmaps/
    cp resources/icons/catfish-symbolic.png /usr/share/pixmaps/
}

install_fonts() {
    echo -e "Installing fonts..."
    mv resources/fonts/SF/ /usr/share/fonts/
    chown root:root -R /usr/share/fonts/SF/
    fc-cache -f
}

install_wallpaper() {
    cp resources/backgrounds/Catalina.jpg /usr/share/backgrounds/
    chmod 644 /usr/share/backgrounds/Catalina.jpg
    chown root:root /usr/share/backgrounds/Catalina.jpg
}

install_plank_theme() {
    mv resources/plank/California/ /usr/share/plank/themes/
    chmod 755 /usr/share/plank/themes/California
    chmod 644 /usr/share/plank/themes/California/*.theme
    chown root:root -R /usr/share/plank/themes/California
}

install_menus() {
    # Menu binary
    mv resources/menus/bin/comice-session /usr/bin/
    chmod 755 /usr/bin/comice-session
    chown root:root /usr/bin/comice-session
    # Menu Items
    mv resources/menus/items/comice-logout.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-logout.desktop
    chown root:root /usr/share/applications/comice-logout.desktop
    mv resources/menus/items/comice-shutdown.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-shutdown.desktop
    chown root:root /usr/share/applications/comice-shutdown.desktop
    mv resources/menus/items/comice-restart.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-restart.desktop
    chown root:root /usr/share/applications/comice-restart.desktop
    mv resources/menus/items/comice-sleep.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-sleep.desktop
    chown root:root /usr/share/applications/comice-sleep.desktop
    mv resources/menus/items/comice-appstore.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-appstore.desktop
    chown root:root /usr/share/applications/comice-appstore.desktop
    mv resources/menus/items/comice-settings.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-settings.desktop
    chown root:root /usr/share/applications/comice-settings.desktop
    mv resources/menus/items/comice-about.desktop /usr/share/applications/
    chmod 644 /usr/share/applications/comice-about.desktop
    chown root:root /usr/share/applications/comice-about.desktop
    # Menu XDG for XFCE4
    mv resources/menus/xdg/comice.menu /etc/xdg/menus/
    chmod 644 /etc/xdg/menus/comice.menu
    chown root:root /etc/xdg/menus/comice.menu
}

install_debian_packages
install_and_compile_lightpad
install_gtk_themes
install_icon_themes
install_fonts
install_wallpaper
install_plank_theme
install_menus
