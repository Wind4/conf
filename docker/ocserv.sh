#!/bin/bash
set -e

CURRENT_DIR=$(readlink -f .)
CONFIG_DIR=${CURRENT_DIR}/ocserv/
APP_NAME="ocserv"

if [ -f "${CONFIG_DIR}" ]; then
  mkdir -p ${CONFIG_DIR}
fi

docker rm -f ${APP_NAME} || true
docker run --name ${APP_NAME} \
  --detach \
  --privileged \
  --publish 443:443 \
  --publish 443:443/udp \
  --restart=always \
  -e CA_CN="CRSOO.COM" \
  -e CA_ORG="WWW.CRSOO.COM Inc." \
  -e CA_DAYS=365 \
  -e SRV_CN=www.crsoo.com \
  -e SRV_ORG="CRSOO.COM" \
  -e SRV_DAYS=31 \
  -e NO_TEST_USER=1 \
  -v ${CONFIG_DIR}:/etc/ocserv/ \
  tommylau/ocserv
