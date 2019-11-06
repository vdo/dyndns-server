#!/bin/bash

export ZONE=${ZONE:-default}
export UPDATE_HOST=${UPDATE_HOST:-127.0.0.1}
export RECORD_TTL=${RECORD_TTL:-30}
export DLR='$'

[ -f "/etc/bind/$ZONE.zone" ] || envsubst < "/etc/bind/templates/template.zone" > "/etc/bind/$ZONE.zone"
[ -f "/etc/bind/named.conf" ] || envsubst < "/etc/bind/templates/named.conf" > "/etc/bind/named.conf"

/usr/sbin/named -d 2 -f -c /etc/bind/named.conf