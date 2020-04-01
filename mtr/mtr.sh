#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: mtr.sh <ip>"
fi

OUT_HOST=$(echo ${CRIBL_TCPJSON} | cut -f 1 -d:)
OUT_PORT=$(echo ${CRIBL_TCPJSON} | cut -f 2 -d:)
mtr --report -c 5 -i 1 --json --no-dns ${1} | jq -M -c . | tee -a /tmp/mtr.log | nc ${OUT_HOST} ${OUT_PORT}
