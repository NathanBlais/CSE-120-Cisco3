#!/bin/sh
#name of project
#description of project
#project website

#How to use this script: 
: '
    When you call the script it should be used like this:
       ./change_DNS.sh /path/to/wg0.conf "new dns ip" 

'

##### VARIABLES #####

configPath="$1"
newIP="$2"

##Start##
#make sure ip is valid
./valid_ip.sh $2
if [ $? = 1 ];then
    exit 1;
fi

#Get old ip adress
oldIP=$(sed "s/#.*//" $1 | grep DNS | sed "s/DNS = //")

#substitute new ip adress
sed -i "" "s/$oldIP/$newIP/" $1
echo "DNS is now $(sed "s/#.*//" $1 | grep DNS | sed "s/DNS = //")"

exit 0