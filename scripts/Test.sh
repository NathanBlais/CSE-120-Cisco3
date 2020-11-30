#!/bin/sh


configPath="/etc/wireguard/wg0.conf"
directoryPath="/etc/wireguard/"
removeClient="jerma33"

doesClientExist=$(grep "$removeClient begin" $configPath | cut -d ' ' -f 4)

if [ $doesClientExist = $removeClient ];then
    echo "Client Exists"
    #remove client
    sed -i "/\ $removeClient begin/,/\# $removeClient end/d" $configPath
    echo "Client Removed"
    exit 0
else
    echo "Client Does Not Exists"
    exit 1
fi