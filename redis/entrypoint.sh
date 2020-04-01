#!/bin/sh
mkdir -p /var/log/gogen
mkdir /var/log/beats

if [ "$1" = "start" ]; then
    sleep 5 && sh /sbin/loaddata.sh &
    redis-server
fi

exec "$@"
