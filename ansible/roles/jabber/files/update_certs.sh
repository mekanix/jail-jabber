#!/bin/sh

DOMAIN="$1"
if [ -z "${DOMAIN}" ]; then
  echo "Usage $0 <domain>" >&2
  exit 1
fi

cat /etc/certs/${DOMAIN}/privkey.pem >/usr/local/etc/prosody/certs/${DOMAIN}.key
cat /etc/certs/${DOMAIN}/fullchain.pem >/usr/local/etc/prosody/certs/${DOMAIN}.crt
chown prosody:prosody /usr/local/etc/prosody/certs/${DOMAIN}.*
chmod 600 /usr/local/etc/prosody/certs/${DOMAIN}.*
service prosody reload
exit 0
