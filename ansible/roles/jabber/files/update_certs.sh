#!/bin/sh

DOMAIN="$1"
if [ -z "${DOMAIN}" ]; then
  echo "Usage $0 <domain>" >&2
  exit 1
fi


PRIVKEY=/usr/local/etc/ejabberd/certs/privkey.pem
SHOULD_UPDATE=no
CERT_DIFF="dummy"

if [ -e ${PRIVKEY} ]; then
  CERT_DIFF=`diff /etc/certs/${DOMAIN}/privkey.pem ${PRIVKEY}`
fi


if [ ! -z "${CERT_DIFF}" ]; then
  cat /etc/certs/${DOMAIN}/privkey.pem >/usr/local/etc/ejabberd/certs/${DOMAIN}.key
  cat /etc/certs/${DOMAIN}/fullchain.pem >/usr/local/etc/ejabberd/certs/${DOMAIN}.crt
  chown ejabberd:ejabberd /usr/local/etc/ejabberd/certs/${DOMAIN}.*
  chmod 600 /usr/local/etc/ejabberd/certs/${DOMAIN}.*
  service ejabberd reload
fi
exit 0
