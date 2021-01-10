# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadolph <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/01 22:22:38 by sadolph           #+#    #+#              #
#    Updated: 2020/12/04 23:05:24 by sadolph          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="sadolph"

RUN			apk update && apk upgrade && apk add																\
			supervisor

RUN			wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN			wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN			apk add glibc-2.32-r0.apk

RUN			mkdir -p /etc/influxdb
RUN			wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.2-static_linux_amd64.tar.gz
RUN			tar -zxvf influxdb-1.8.2-static_linux_amd64.tar.gz -C /etc/influxdb
RUN			rm -rf influxdb-1.8.2-static_linux_amd64.tar.gz
#RUN			mv /influxdb-1.8.2-1 /etc/influxdb

RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN			tar -zxvf telegraf-1.15.3_linux_amd64.tar.gz
RUN			cp -r telegraf-1.15.3/* /
RUN			rm -rf telegraf-1.15.3_linux_amd64.tar.gz telegraf-1.15.3

RUN			./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

RUN			mkdir -p /var/lib/influxdb
COPY		supervisor.conf /etc/supervisord.conf

VOLUME		/root/.influxdb

EXPOSE		8086

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
