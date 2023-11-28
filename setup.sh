#!/bin/bash

# set-up commands

# must run as sudo

# echo "$PWD is the current dir" 

if [ "$EUID" -ne 0 ]; then
	echo "This script must be run with sudo or as root."
	exit 1
else
	echo "Running with elevated privileges."
fi

updating_dependencies() {
# this function should check existing versions and update as required. 
	DEP_VERS=$($1 --version)
	NO_UPDATES=0
	echo "$1 version was $DEP_VERS" 
	sudo $1 update
	NUM_UPDATES=$(sudo $1 list --upgradable 2>/dev/null | grep -c 'upgradable')

	if [$NUM_UPDATES -gt $NO_UPDATES]; then
		read -p "Would you like to update $1 now? (y/N): "
#		case $YN in
#			[Yy]* ) make install; break;;
#			[Nn]* ) exit;;
	else echo "Hello world"
	fi

	return 0	
}


updating_dependencies "apt"

# sudo apt update && apt upgrade


# >error-log.txt
# exec 2>>error-log.txt


#sudo apt-get update
#sudo apt-get upgrade

handle_error() {
	echo "THIS IS YOUR SCRIPT Error occured during installation:-type"
	return 0
} 

exit

	
# other random installations that I haven't put into the script yet
# wsl --install -d Ubuntu
# conda install -c anaconda git
# the conda installation script (look in this dir)
