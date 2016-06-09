#!/bin/bash
set -e

PACKAGE_NAME="n2n_v2"
PACKAGE_TAG="latest"

APP_NAME="n2n_v2_pub"
N2N_PORT=86

docker rm -f ${APP_NAME} || true
docker run --name ${APP_NAME} \
 --detach \
 --publish ${N2N_PORT}:8765/udp \
 --restart=always \
 ${PACKAGE_NAME}:${PACKAGE_TAG} \
 -l 8765 \
 -v
