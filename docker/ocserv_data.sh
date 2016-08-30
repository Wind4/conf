#!/bin/bash
set -e

VOLUME_NAME="ocserv_data"

docker create --name ${VOLUME_NAME} \
  -v /etc/ocserv \
  tommylau/ocserv
