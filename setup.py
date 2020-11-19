#!/usr/bin/env python3
from setuptools import setup
from os import path

this_directory = path.abspath(path.dirname(__file__))

setup(
    name = "wgprivnet",
    version = "0.0.1",
    description = ("Private Network implementation for WireGuard"),
    url = "https://github.com/NathanBlais/CSE-120-Cisco3",
    install_requires = [ "pyroute2" ],
)