FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add influxdb openrc
RUN mkdir +p /var/lib/influxdb

VOLUME /var/lib/influxdb

#init
COPY ./start.sh .
RUN chmod +x /start.sh
CMD ./start.sh