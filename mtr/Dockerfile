FROM alpine:3.11
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ mtr jq
ADD mtr.sh /sbin/mtr.sh
ADD entrypoint.sh /sbin/entrypoint.sh
RUN echo '*  *  *  *  *    /sbin/mtr.sh ${PING_HOST}' > /etc/crontabs/root && \
    echo '*  *  *  *  *    sleep 15 && /sbin/mtr.sh ${PING_HOST}' >> /etc/crontabs/root && \
    echo '*  *  *  *  *    sleep 30 && /sbin/mtr.sh ${PING_HOST}' >> /etc/crontabs/root && \
    echo '*  *  *  *  *    sleep 45 && /sbin/mtr.sh ${PING_HOST}' >> /etc/crontabs/root
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]