#!/bin/sh
#name of project
#description of project
#project website

    # Create folder if nonexistent
    test ! -d /etc/wireguard && mkdir /etc/wireguard

	# For security reasons set umask to 077
	umask 077

    #only root is able to enter the wireguard folder
	chown root:root /etc/wireguard
	chmod 700 /etc/wireguard

    mkdir -p /etc/wireguard/configs
	mkdir -p /etc/wireguard/keys

	# Create server keys
    wg genkey | tee /etc/wireguard/server_private.key | wg pubkey > /etc/wireguard/server_public.key

    PriKey=$(cat /etc/wireguard/server_private.key)

	# Server config
	[ -f '/etc/wireguard/wg0.conf' ] || cat << _EOF_ > /etc/wireguard/wg0.conf
[Interface]
Address = 10.9.0.1/24
SaveConfig = true
PrivateKey = $PriKey
ListenPort = 51820

PostUp = iptables -A FORWARD -i wireguard -j ACCEPT; iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE; ip6tables -A FORWARD -i wireguard -j ACCEPT; ip6tables - t nat -A POSTROUTING -o enp0s3 -j MASQUERADE;
PostDown = iptables -D FORWARD -i wireguard -j ACCEPT; iptables -t nat -D POSTROUTING -o enp0s3 -j MASQUERADE; ip6tables -D FORWARD -i wireguard -j ACCEPT; ip6tables - t nat -D POSTROUTING -o enp0s3 -j MASQUERADE;

_EOF_

    #if systemctl doesn't exist
    if ! [ -x /bin/systemctl ]; then
        echo "Only supports systemctl installation failed"
        exit 1;
    fi

    systemctl enable wg-quick@wg0