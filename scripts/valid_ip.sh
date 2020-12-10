#!/bin/sh
#name of project
#description of project
#project website
#Code From: user:ghoti https://stackoverflow.com/questions/13777387/check-for-ip-validity
# Test an IP address for validity:
# Usage:
#      valid_ip IP_ADDRESS
#      if [[ $? -eq 0 ]]; then echo good; else echo bad; fi
#   OR
#      if valid_ip IP_ADDRESS; then echo good; else echo bad; fi
#
#   ToDo: make it work for multiple ip adress seperated by ', '
#

ip=${1:-$1}

if expr "$ip" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
  IFS=.
  set $ip
  for quad in 1 2 3 4; do
    if eval [ \$$quad -gt 255 ]; then
      echo "fail ($ip)"
      exit 1
    fi
  done
  echo "success ($ip)"
  exit 0
else
  echo "fail ($ip)"
  exit 1
fi
