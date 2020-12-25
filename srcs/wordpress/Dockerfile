# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadolph <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/01 22:22:38 by sadolph           #+#    #+#              #
#    Updated: 2020/11/04 23:05:24 by sadolph          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="sadolph"

#
USER		root
#WORKDIR		project

RUN			apk update && apk upgrade &&									\
			apk add --no-cache nginx										\
			php7-common php7-iconv php7-json php7-gd php7-curl php7-xml 	\
			php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql 	\
			php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext 		\
			php7-ldap php7-ctype php7-dom php7-fpm							\
			openrc

RUN			mkdir /lol
RUN			wget http://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz
RUN			rm latest.tar.gz
RUN			mv wordpress /lol

RUN			chgrp -R root /lol
RUN			chmod -R 775 /lol
RUN			mkdir -p /run/nginx
#RUN			chmod -R 775 /run/nginx

#COPY		nginx_default /etc/nginx/nginx.conf
COPY		nginx_default /etc/nginx/conf.d/default.conf
COPY		wp-config.php /lol/wordpress/wp-config.php
COPY		supervisord.conf /etc/supervisord.conf

EXPOSE		5050

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

#COPY		start.sh /
#RUN			chmod +x /start.sh
#CMD			/start.sh
