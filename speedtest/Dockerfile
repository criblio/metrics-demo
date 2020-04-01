FROM alpine:3.11
RUN apk add --no-cache python py-pip jq
RUN pip install speedtest-cli
ADD entrypoint.sh /sbin/entrypoint.sh
ADD speedtest.sh /sbin/speedtest.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]