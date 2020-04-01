#!/bin/sh

if [ "$1" == "start" ]; then
    echo "*/${SPEEDTEST_INTERVAL_MINUTES}  *  *  *  *    /sbin/speedtest.sh" > /etc/crontabs/root
    touch /tmp/speedtest.log
    # Run the first manually
    . /sbin/speedtest.sh
    crond -c /etc/crontabs -L /tmp/cron.log
    tail -f /tmp/speedtest.log | jq . &
    tail -f /tmp/cron.log
fi

exec "$@"
