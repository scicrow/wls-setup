#!/bin/bash


# specifying the home directory
script_dir="$(cd $(dirname "${BASH_SOURCE[0]}");pwd)"
recycle_bin_dir="$script_dir/.recyclebin"
log_path="$recycle_bin_dir/.recycle.log"

if [ ! -e "recycle_bin_dir" ]
then
	        mkdir "$recycle_bin_dir"
		        echo "Created new recycle bin directory at :" "$recycle_bin_dir"
fi

