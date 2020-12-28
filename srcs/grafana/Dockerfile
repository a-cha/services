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

RUN			apk	update && apk upgrade && apk add
#			grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing

RUN			wget https://grafanarel.s3.amazonaws.com/builds/grafana-3.1.1-1470047149.linux-x64.tar.gz && \
RUN			tar -xzf grafana-*linux-x64.tar.gz && \

RUN			wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN			wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN			apk add glibc-2.32-r0.apk

#COPY		boards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml
#COPY		sources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

#COPY		FT_SERVICE-1605816702189.json /var/lib/grafana/dashboards/
#RUN			cd /usr/share/grafana

#ENTRYPOINT	["/usr/sbin/grafana-server"]
