FROM alpine:latest

RUN apk update
RUN apk add openrc influxdb ca-certificates wget supervisor

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
		https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

RUN mkdir -p /run/influxdb

RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN     apk add glibc-2.32-r0.apk

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN tar -zxf telegraf-1.15.2_linux_amd64.tar.gz
RUN  mv telegraf-1.15.2 telegraf
RUN  rm telegraf-1.15.2_linux_amd64.tar.gz
RUN cp -r telegraf/* /

RUN     mkdir -p /var/lib/influxdb

VOLUME ["/var/lib/"]
VOLUME ["/sys/fs/cgroup"]

COPY supervisord.conf /etc/
RUN		./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]