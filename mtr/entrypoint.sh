#!/bin/sh

if [ "$1" == "start" ]; then
    touch /tmp/mtr.log
    crond -c /etc/crontabs -L /tmp/mtr.log && tail -f /tmp/mtr.log
fi

exec "$@"
