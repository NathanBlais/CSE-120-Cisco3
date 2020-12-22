#!/bin/sh
#name of project
#description of project
#project website
#
#install instructions
#...
#...


##### VARIABLES #####
_os="none"
distribution="none"

###Distro Specific Imports###

: '

See if the programs and their same version numbers are already installed
# see which setup already exists

# Verify there is enough disk space for the install

Install or Update wiregaurd and other programs 

Choose whether User or Server

'
main(){
#Header
	echo "=*=*=*=*=*=*=*=*=*=*=*=Installer=*=*=*=*=*=*=*=*=*=*=*="

#Check OS & Distro
	osCheck
	distroCheck

#Check that user is root
	rootCheck
	
#Check for disk space
	#diskSpaceCheck

#Install using OS's normal method
	echo "=*=*=Starting Installation=*=*="
	if [ $_os = "Linux" ]; then
		case $distribution in 

		DietPi)
			#install from reposetory
			apt-get update && apt-get -y install qrencode python3 python3-pip python3-tk python3-django apache2
			#install from pip
			pip3 install pyroute2 Django django-crispy-forms wheel virtualenv distlib tk setuptools asgiref
			pip3 install --upgrade django
			#install Wiregaurd, OpenSSH and __ using DietPie's own installer.
			/boot/dietpi/dietpi-software install 172 0 6 			
			#set up server config file
#needs testing
			sed '15,$d' /etc/wireguard/wg0.conf
			#remove example client files
#needs testing			
			rm client_public.key
			rm client_private.key
			rm wg0-client.conf
			;;
		Debian|Raspbian|Ubuntu)
			echo "Your distribution ($distribution) is a WIP, but not yet supported. "
			exit 1;;
			#apt-get update && apt-get install iptables wireguard qrencode
		*)
			echo "Your distribution ($distribution) is not supported. "
			exit 1;;
		esac		
	else
		echo "The program should have already ended"
		exit 1
	fi

#add the website as a dameon that runs on sart up.

##temporary 
#start the website
	python3 manage.py runserver 0.0.0.0:8080
			
	exit 0
}

##### FUNCTIONS #####

##Check for compatability##

osCheck(){
#List of OS found here https://en.wikipedia.org/wiki/Uname
	_os=`uname`
	case $_os in 
		Linux)
			echo "LINUX is supported" ;;
		Darwin|*BSD|SunOS|Windows*)
			echo "Your operating system $_os is not yet supported"
			exit 1 ;;
  		*)
			echo "unknown: $OSTYPE"
			exit 1 ;;
	esac 

}

distroCheck(){
	#grab the distro
	distribution=$(uname -n) #`uname -n`

	#check the distro
	case $distribution in 
	DietPi)
		echo "Your distribution ($distribution) is supported.";;
	Debian|Raspbian|Ubuntu)
		echo "Your distribution ($distribution) is a WIP, but not yet supported. "
		exit 1;;
	*)
		echo "Your distribution ($distribution) is not supported. "
		exit 1;;
	esac
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