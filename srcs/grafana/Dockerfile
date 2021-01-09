# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadolph <sadolph@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/28 21:32:55 by sadolph           #+#    #+#              #
#    Updated: 2020/12/28 21:32:55 by sadolph          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="sadolph"

RUN			apk	update && apk upgrade

RUN			wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN			wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN			apk add glibc-2.32-r0.apk

RUN			wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz
RUN			tar -zxvf grafana-enterprise-7.3.6.linux-amd64.tar.gz
RUN			rm -f grafana-enterprise-7.3.6.linux-amd64.tar.gz

COPY		boards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml
COPY		sources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

RUN			rm -f /grafana-7.3.6/data/grafana.db
COPY		grafana.db /grafana-7.3.6/data/

WORKDIR		grafana-7.3.6

EXPOSE		3000

ENTRYPOINT	["bin/grafana-server"]
