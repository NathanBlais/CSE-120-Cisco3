#!/bin/sh
#name of project
#description of project
#project website

##### VARIABLES #####
clientName="none"


##Start##

# Create Client keys
    wg genkey | tee /etc/wireguard/keys/client_private.key | wg pubkey > /etc/wireguard/keys/client_public.key

# Find an unused number for the last octet of the client IP

octet=2
while grep AllowedIPs /etc/wireguard/wg0.conf | cut -d "." -f 4 | cut -d "/" -f 1 | grep -q "$octet"; do
	(( octet++ ))
done

# Check if address space is full
if [[ "$octet" -eq 255 ]]; then
	echo "253 clients are already configured. The WireGuard internal subnet is full!"
	exit
fi

# Configure client in the server cinfig
	cat << EOF >> /etc/wireguard/wg0.conf
# $clientName added 
[Peer]
PublicKey = $(<client_public.key)
AllowedIPs = 10.8.0.$octet/32

EOF


# Create client config
	[[ -f 'wg0.conf-client' ]] || cat << _EOF_ > wg0-client.conf
[Interface]
Address = 10.8.0.$octet/24$
DNS = cat /etc/resolv.conf | cut -d " " -f 2 | cut -d $'\n'  -f 1
PrivateKey = $(<client_private.key)

[Peer]
PublicKey = $(<server_public.key)
# Tunnel all network traffic through the VPN:
#       AllowedIPs = 0.0.0.0/0, ::/0
# Tunnel access to server-side local network only:
#       AllowedIPs = 192.168.1.0/24
# Tunnel access to VPN server only:
#       AllowedIPs = 192.168.1.20/32
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = $(hostname -I | cut -d " " -f 1):51820

#Uncomment the following, if you're behind a NAT and want the connection to be kept alive.
#PersistentKeepalive = 25
_EOF_
}