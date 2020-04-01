#!/bin/sh
OUT_HOST=$(echo ${CRIBL_TCPJSON} | cut -f 1 -d:)
OUT_PORT=$(echo ${CRIBL_TCPJSON} | cut -f 2 -d:)
speedtest --json | tee -a /tmp/speedtest.log | nc ${OUT_HOST} ${OUT_PORT}