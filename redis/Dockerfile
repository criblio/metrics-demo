FROM redis:latest
ADD entrypoint.sh /sbin/entrypoint.sh
ADD loaddata.sh /sbin/loaddata.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]
ADD session.csv /data/session.csv
CMD ["start"]
