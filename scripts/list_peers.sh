#!/bin/sh
#name of project
#description of project
#project website

#How to use this script:
: '
    When you call the script it should be used like this:
       ./list_peers.sh

'

##### VARIABLES #####
configPath="/etc/wireguard/wg0.conf"
directoryPath="/etc/wireguard/"

##Start##

grep end $configPath | cut -d ' ' -f 1 | sed "s/#//"