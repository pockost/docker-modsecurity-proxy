#!/bin/sh
set -e

PROXY_PORT=${PROXY_PORT:-80}

if [ -z "${PROXY_HOST}" ]
then
  echo "ERROR: You have to set PROXY_HOST environment variable."
  exit 1
fi


sed -i "s/___PROXY_HOST___/${PROXY_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/___PROXY_PORT___/${PROXY_PORT}/g" /etc/nginx/conf.d/default.conf

exec /usr/local/bin/docker-entrypoint.sh "$@"
