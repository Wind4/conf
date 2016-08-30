#!/bin/bash
set -e

APP_NAME="ocserv"
VOLUME_NAME="ocserv_data"
PORT=443

docker rm -f ${APP_NAME} || true
docker run --name ${APP_NAME} \
  --detach \
  --privileged \
  --publish ${PORT}:443 \
  --publish ${PORT}:443/udp \
  --restart=always \
  -e CA_CN="CRSOO.COM" \
  -e CA_ORG="WWW.CRSOO.COM Inc." \
  -e CA_DAYS=365 \
  -e SRV_CN=www.crsoo.com \
  -e SRV_ORG="CRSOO.COM" \
  -e SRV_DAYS=31 \
  -e NO_TEST_USER=1 \
  --volumes-from ${VOLUME_NAME} \
  tommylau/ocserv
