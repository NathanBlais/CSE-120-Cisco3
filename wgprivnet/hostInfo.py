#!/usr/bin/env python3


class hostInfo(object):
    
    __slots__ = (
        "publicKey",
        "privateKey",
        "IP",     
        "port"
    )

    def __init__(self, connections):
        self.publicKey = connections[0].getAttr('PUBLIC_KEY')
        self.privateKey = connections[0].getAttr('PRIVATE_KEY')
        self.ip = connections[0].getAttr('IP')
        self.port = connections[0].getAttr('PORT')
  

    def __repr__(self):
        return repr({
            'publicKey': self.publicKey,
            'privateKey': self.privateKey,
            'IP': self.ip,
            'port': self.port,
        })
