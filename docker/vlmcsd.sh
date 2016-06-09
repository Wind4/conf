#!/bin/bash
set -e

PACKAGE_NAME="vlmcsd"
PACKAGE_TAG="latest"

APP_NAME="vlmcsd"
SRV_PORT=1688

docker rm -f ${APP_NAME} || true
docker run --name ${APP_NAME} \
 --detach \
 --publish ${SRV_PORT}:1688 \
 --publish ${SRV_PORT}:1688/udp \
 --restart=always \
 ${PACKAGE_NAME}:${PACKAGE_TAG}
