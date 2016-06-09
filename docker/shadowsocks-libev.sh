#!/bin/bash
set -e

PACKAGE_NAME="shadowsocks-libev"
PACKAGE_TAG="latest"

APP_NAME="shadowsocks"
SS_PORT=8448
SS_PASSWORD="password"
SS_METHOD="aes-256-cfb"
SS_TIMEOUT=300

docker rm -f ${APP_NAME} || true
docker run --name ${APP_NAME} \
 --detach \
 --publish ${SS_PORT}:8448 \
 --publish ${SS_PORT}:8448/udp \
 --restart=always \
 ${PACKAGE_NAME}:${PACKAGE_TAG} \
 -s 0.0.0.0 \
 -p 8448 \
 -k ${SS_PASSWORD} \
 -m ${SS_METHOD} \
 -t ${SS_TIMEOUT} \
 -u
