#!/usr/bin/env python3


class WireGuardPeer(object):
    
    __slots__ = (
        "publicKey",
        "qrKey",
        "endpoint",     
        "rBytes",
        "sBytes"
    )

    def __init__(self, peer):
        self.publicKey = publicKeySetup()
        self.qrKey = qrKeySetup()
        self.endpoint = peer.getAttr('ENDPOINT')
        self.rBytes = peer.getAttr('RECEIVED_BYTES')
        self.rBytes = peer.getAttr('SENT_BYTES')
  

    def __repr__(self):
        return repr({
            'publicKey': self.publicKey,
            'qrKey': self.qrKey,
            'endpoint': self.endpoint,
            'rBytes': self.rBytes,
            'sBytes': self.sBytes,
        })
