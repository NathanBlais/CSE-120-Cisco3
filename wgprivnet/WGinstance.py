#!/usr/bin/env python3
import subprocess
import sys

from pyroute2 import netlink

from .setupQrKey import setupQrKey
from .setupPubKey import setupPubKey
from .hostInfo import hostInfo

class WireGuard(object):
    def __init__(self, **kwargs):
        
    def remove_client(username):
        process = subprocess.run(['./../scripts/remove_client.sh', username], stdout=subprocess.PIPE)
        
    def change_dns(path, IP_Addr):
        process = subprocess.run(['./../scripts/change_DNS.sh', path, IP_Addr], stdout=subprocess.PIPE)

    def get_interface(self, interface):
        device = self.__device.get_device(interface)
        connections = self.__get(device)

        return hostInfo(connections)

    def list_peers():
        process = subprocess.run(['./../scripts/remove_client.sh', username], stdout=subprocess.PIPE)

    def make_client_config(username):
        process=subprocess.run(['./client_conf_make.sh', username], stdout=subprocess.PIPE)

