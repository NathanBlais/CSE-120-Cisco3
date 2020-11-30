#!/bin/sh
#name of project
#description of project
#project website

#How to use this script: 
: '
    When you call the script it should be used like this:
       ./client_conf_make.sh "name of client"
	   
'

##### VARIABLES #####
clientName="$1"

##Start##

# Make sure name isn't already in use and isn't empty
##add this funtionality later or move it somewhere else 

# Find an unused number for the last octet of the client IP
octet=2
while grep AllowedIPs /etc/wireguard/wg0.conf | cut -d "." -f 4 | cut -d "/" -f 1 | grep -q $octet; do 
    octet=$((octet + 1))
done

# Create folder if nonexistent
test ! -d /etc/wireguard/keys && mkdir /etc/wireguard/keys

# Create Client keys
wg genkey | tee /etc/wireguard/keys/client_private$((octet - 1)).key | wg pubkey > /etc/wireguard/keys/client_public$((octet - 1)).key

# Check if address space is full
if [ "$octet" -eq 255 ]; then
	echo "253 clients are already configured. The WireGuard internal subnet is full!"
	exit
fi

clientNumber=$((octet - 1))
PubKey=$(cat /etc/wireguard/keys/client_public$clientNumber.key)

# Configure client in the server cinfig
	cat << EOF >> /etc/wireguard/wg0.conf
# Client $clientNumber: $clientName begin 
[Peer]
PublicKey = $PubKey
AllowedIPs = 10.9.0.$octet/32
#$clientName end

EOF

# Create folder if nonexistent
test ! -d /etc/wireguard/client-conf && mkdir /etc/wireguard/client-conf

PriKey=$(cat /etc/wireguard/keys/client_private$clientNumber.key)
SPriKey=$(cat /etc/wireguard/server_public.key)
DNSholder=$(echo $(cat /etc/resolv.conf) | cut -d ' ' -f 2)
# Create client config
	[ -f '/etc/wireguard/client-conf/wg0-client$clientNumber.conf' ] || cat << _EOF_ > /etc/wireguard/client-conf/wg0-client$clientNumber.conf
[Interface]
Address = 10.9.0.$octet/24
DNS = $DNSholder
PrivateKey = $PriKey

[Peer]
PublicKey = $SPriKey
# Tunnel all network traffic through the VPN:
#       AllowedIPs = 0.0.0.0/0, ::/0
# Tunnel access to server-side local network only:
#       AllowedIPs = 192.168.1.0/24
# Tunnel access to VPN server only:
#       AllowedIPs = 192.168.1.20/32
AllowedIPs = 0.0.0.0/0, ::/0, $DNSholder
Endpoint = $(hostname -I | cut -d " " -f 1):51820

#Uncomment the following, if you're behind a NAT and want the connection to be kept alive.
#PersistentKeepalive = 25
_EOF_

exit