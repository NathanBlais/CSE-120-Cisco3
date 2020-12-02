#!/usr/bin/env python3
import subprocess
import sys

from pyroute2 import netlink

#from setupQrKey import setupQrKey
#from setupPubKey import setupPubKey
from hostInfo import hostInfo

userLogin=hostInfo()

class WireGuard(object):

           def remove_client(username):
                      process = subprocess.run(['./../scripts/remove_client.sh', username], stdout=subprocess.PIPE)

           def change_dns(path, IP_Addr):
                      process = subprocess.run(['./../scripts/change_DNS.sh', path, IP_Addr], stdout=subprocess.PIPE)

           def list_peers(self):
                      process = subprocess.run(['./../scripts/list_peers.sh'], stdout=subprocess.PIPE)
                      print(process)

           def make_client_config(username):
                      process=subprocess.run(['./client_conf_make.sh', username], stdout=subprocess.PIPE)

           def login(self):
                      userLogin.login()

