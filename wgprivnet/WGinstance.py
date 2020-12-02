#!/usr/bin/env python3
import subprocess
import sys

from pyroute2 import netlink

from .setupQrKey import setupQrKey
from .setupPubKey import setupPubKey
from .hostInfo import hostInfo

bashCommand = "cwm --rdf test.rdf --ntriples > test.nt"

class WireGuard(object):
    __slots__ = ( "__socket" )

    def __init__(self, **kwargs):
        

    def __del__(self):
        process = subprocess.run(['./../scripts/remove_client.sh'], stdout=subprocess.PIPE)
        

    def __get(self, device):
        flags = netlink.NLM_F_REQUEST | netlink.NLM_F_DUMP
        return self.__socket.nlm_request(device, msg_type=self.__socket.prid, msg_flags=flags)

    def __set(self, device):
        flags = netlink.NLM_F_ACK | netlink.NLM_F_REQUEST
        return self.__socket.nlm_request(device, msg_type=self.__socket.prid, msg_flags=flags)

    def get_interface(self, interface):
        device = self.__device.get_device(interface)
        connections = self.__get(device)

        return hostInfo(connections)

    def set_interface(self, interface, private_key, port):

    def remove_peer(self, interface, publicKey):

    def set_peer(Uname):
        process=subprocess.run(['./client_conf_make.sh', Uname], stdout=subprocess.PIPE)

