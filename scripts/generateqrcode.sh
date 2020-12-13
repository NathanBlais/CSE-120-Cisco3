#!/bin/sh
#name of project
#description of project
#project website

#How to use this script: 
: '
    When you call the script it should be used like this:
      ./generateqrcode.sh /path/to/client.config

'

##### VARIABLES #####
configPath="$1"

##START##
qrencode -t ansiutf8 < $1

exit 0