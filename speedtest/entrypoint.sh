#!/bin/sh

if [ "$1" == "start" ]; then
    echo "0  */${SPEEDTEST_INTERVAL_HOURS}  *  *  *    /sbin/speedtest.sh" > /etc/crontabs/root
    touch /tmp/speedtest.log
    # Run the first manually
    sleep 120
    . /sbin/speedtest.sh
    crond -c /etc/crontabs -L /tmp/cron.log
    tail -f /tmp/speedtest.log | jq . &
    tail -f /tmp/cron.log
fi

exec "$@"
