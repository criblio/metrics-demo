FROM node:lts
ADD . /opt/apiserver
RUN  cd /opt/apiserver && npm install
ADD customer_master_small.csv /data/customer_master_small.csv
CMD ["node","/opt/apiserver/server.js"]
