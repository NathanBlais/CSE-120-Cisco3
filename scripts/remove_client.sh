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

#remove client from server.conf

if [ grep "# $REMOVECLIENT begin"]


REMOVECLIENT = "$@"
sed -i "/\# $REMOVECLIENT begin/,/\# $REMOVECLIENT end/d" /etc/wireguard/wg0.conf
echo "Client named $REMOVECLIENT has been removed."

#reboot wiregaurd
wg syncconf wg0 <(wg-quick strip wg0)