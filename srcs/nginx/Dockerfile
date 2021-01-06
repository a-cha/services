# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadolph <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/01 22:22:38 by sadolph           #+#    #+#              #
#    Updated: 2020/11/14 22:28:45 by sadolph          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="sadolph"

WORKDIR		/project

RUN			apk update &&													\
			apk add nginx													\
			openssl															\
			openssh															\
			supervisor

COPY		nginx_default /etc/nginx/nginx.conf
COPY		supervisor.conf /etc/supervisord.conf
COPY		index.html /

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
			-keyout /etc/ssl/certs/localhost.key 							\
			-out /etc/ssl/certs/localhost.crt 								\
			-subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=4th Wave/CN=sadolph"

EXPOSE		80 443 22

RUN			mkdir -p /run/nginx
#RUN			ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
COPY		start.sh /project/
RUN			chmod 755 start.sh

ENTRYPOINT	sh start.sh
