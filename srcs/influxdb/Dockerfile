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

RUN			apk update && apk upgrade && apk add									\
			telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing	\
			influxdb																\
			supervisor

RUN			telegraf -sample-config --input-filter cpu:mem --output-filter influxdb > telegraf.conf
COPY		telegraf_default.conf /etc/telegraf/telegraf.conf

#RUN			mkdir +p /var/lib/influxdb
RUN			mkdir -p /var/lib/influxdb

VOLUME		/var/lib/influxdb

COPY		supervisor.conf /etc/supervisord.conf

EXPOSE		3000 8086

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
