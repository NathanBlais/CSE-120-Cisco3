#!/bin/sh
#name of project
#description of project
#project website

#How to use this script: 
: '
    When you call the script it should be used like this:
       ./remove_client.sh "name of client"

'

##### VARIABLES #####
configPath="/etc/wireguard/wg0.conf"
directoryPath="/etc/wireguard/"
removeClient="$1"

##Start##
doesClientExist=$(grep "$removeClient begin" $configPath | cut -d ' ' -f 4)

if [ $doesClientExist = $removeClient ];then
    echo "Client Exists"

    ##add way to remove client config file if it still exists

    #remove client from server config
    sed -i "/\ $removeClient begin/,/\# $removeClient end/d" $configPath
    echo "Client Removed"
    exit 0
else
    echo "Client Does Not Exists"
    exit 1
fi

#reboot wiregaurd
wg syncconf wg0 $configPath