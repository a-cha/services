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

RUN			mkdir -p /run/nginx
RUN			rm -f /etc/nginx/nginx.conf
COPY		nginx_default /etc/nginx/nginx.conf
COPY		supervisor.conf /etc/supervisord.conf
COPY		index.html /

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
			-keyout /etc/ssl/certs/localhost.key 							\
			-out /etc/ssl/certs/localhost.crt 								\
			-subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=4th Wave/CN=sadolph"

RUN			adduser -D sad
RUN			echo "sad:sad" | chpasswd
RUN			ssh-keygen -A

EXPOSE		80 443 22

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
