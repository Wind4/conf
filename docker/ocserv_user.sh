#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 username"
  exit
fi

docker exec -it ocserv ocpasswd -c /etc/ocserv/ocpasswd $1
