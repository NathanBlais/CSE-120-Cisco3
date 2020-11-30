#!/usr/bin/env python3
from pyroute2 import netlink

from .setupQrKey import setupQrKey
from .setupPubKey import setupPubKey
from .hostInfo import hostInfo

class WireGuard(object):
    __slots__ = ( "__socket" )

    def __init__(self, **kwargs):
        self.__socket = netlink.generic.GenericNetlinkSocket()
        self.__socket.bind('wireguard', self.__device)

    def __del__(self):
        self.__socket.close()

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

    def set_peer(self, interface, publicKey, qrKey, endpoint):

    def refreshConnections():
        

