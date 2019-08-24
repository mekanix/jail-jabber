#!/bin/sh

DOMAIN="$1"
if [ -z "${DOMAIN}" ]; then
  echo "Usage $0 <domain>" >&2
  exit 1
fi

cat /etc/certs/$1/privkey.pem >/usr/local/etc/ejabberd/certs/cert.pem
cat /etc/certs/$1/fullchain.pem >>/usr/local/etc/ejabberd/certs/cert.pem
chown ejabberd:ejabberd /usr/local/etc/ejabberd/certs/cert.pem
chmod 600 /usr/local/etc/ejabberd/certs/cert.pem
