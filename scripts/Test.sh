#!/bin/sh



test ! -d /etc/wireguard/keys && echo "inside" || echo "outside"

# | cut -d $'\n' -f 1c