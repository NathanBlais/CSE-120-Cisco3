#!/bin/bash
#name of project
#description of project
#project website
#
#install instructions
#...
#...


##### VARIABLES #####


###Distro Specific Imports###

## Import DietPi-Globals ---------------------------------------------------------------
	#. /boot/dietpi/func/dietpi-globals
	#G_CHECK_ROOT_USER
	#G_CHECK_ROOTFS_RW
	#G_INIT

	# Filepath
	#readonly FP_INSTALLED_FILE='/boot/dietpi/.installed'
	#readonly FP_INSTALLED_FILE_TMP='.installed'

#
: '

detect if user is root

Detect which Operating System the user is using

See if the programs and their same version numbers are already installed
# see which setup already exists

# Verify there is enough disk space for the install

Install or Update wiregaurd and other programs 

Choose whether User or Server

'
main(){
#Check OS & Distro
	distroCheck

#if Distro is DietPi install Wiregaurd using DietPie's own installer.
	if [$DIS == "DietPie"];
    #install Wiregaurd using DietPie's own installer.
    	then $dietpi-software install 172
		end 0
	fi


#Check that user is root
	rootCheck

#Check for disk space
	#diskSpaceCheck



}



##### FUNCTIONS #####

#Check for compatability 

distroCheck(){
	#grab the distro
	DIS=$(uname -n)

	#check the distro
	if [[$DIS == "DietPi"]]; #|"Debian"|"Raspbian"|"Ubuntu"];
		then echo "DIS=${DIS}" > ${tempsetupVarsFile}
	fi
}

rootCheck(){
	if [ "$EUID" -ne 0 ];
  		then echo "Please run as root"
  	exit 1
	else
		echo "Running as root"
	fi
}


#diskSpaceCheck(){

#}

#Add funcions to update packages
#Add functions to install dependent packages

#python 3.2+ - $dietpi-software install 130
#pip install Django

#django
#iptables -I INPUT -p tcp --dport 8000 -j ACCEPT

main