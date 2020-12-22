#!/bin/sh
#name of project
#description of project
#project website

#How to use this script: 
: '
    When you call the script it should be used like this:
       ./mount_&_move_conf_to_usb.sh /path/to/client.config

'

##### VARIABLES #####
clientConfig="$1"
#configPath="/Users/nathanblais/wg0.conf"
#directoryPath="/Users/nathanblais"
configPath="/etc/wireguard/wg0.conf"
directoryPath="/etc/wireguard/"

##Start##

#Check that the file exists

#Mount the USB drive ##into temp

##Check that the USB drive can be written to

#Check that the USB drive has a compatable file format

#Check that the USB drive has enough free space

#Move the clientConfig file to the USB drive

##Confirm that the file was successfully transferd 
#Check the hash if the original file against the one on the USB drive

#Unmount the USB drive

