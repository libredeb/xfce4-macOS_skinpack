#!/bin/bash
# Author: Juan Lozano <libredeb@gmail.com>
# Description: Customized skinpack for XFCE4 to look like macOS

# Prevents execution with root user
if [ "$EUID" -eq 0 ]
then
    echo "ERROR: Dont run me with root user"
    exit
fi

# Script Settings (Global vars)
if [ $HOME ] && [ $USER ]
then
    EXEC_USER=$USER
    USER_HOME=$HOME
elif [ $USER ]
then
    EXEC_USER=$USER
    USER_HOME=$( getent passwd "$USER" | cut -d: -f6 )
else
    echo "The user home directory was not found!"
    echo "Please check USER and HOME environment vars"
    exit
fi

install_and_configure() {
    echo "Backing up the current configuration..."
    configurations/backup.sh $USER_HOME
    echo "The necessary resources will be installed."
    echo "Please enter your sudo password!"
    sudo resources/install_resources.sh
    echo "Applying some configurations..."
    configurations/apply.sh $USER_HOME $EXEC_USER
}

remove_and_restore() {
    echo "The installed resources will be removed."
    echo "Please enter your sudo password!"
    sudo resources/remove_resources.sh
    echo "Removing configurations installed."
    configurations/remove.sh $USER_HOME
}

# Subcommands and help 
case "$1" in
    1|install)
        install_and_configure
        ;;
    2|remove)
        remove_and_restore
        ;;
    *)
        echo -e "\n\tUsage: skinpack [command]"
        echo -e "\n\tAvailable commands (You can use name or command number):"
        echo -e "\t\t1 | install   # Install skinpack completely and configure it"
        echo -e "\t\t2 | remove    # Remove skinpack completely and back to the previous configuration"
        exit 1
        ;;
esac
