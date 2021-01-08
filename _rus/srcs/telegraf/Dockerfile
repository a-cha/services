FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing

RUN telegraf -sample-config --input-filter cpu:mem --output-filter influxdb > telegraf.conf

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

#init
COPY ./start.sh /
RUN chmod +x /start.sh
CMD ./start.sh
#telegraf