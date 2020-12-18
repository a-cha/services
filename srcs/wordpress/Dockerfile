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

WORKDIR		/project

RUN			apk update && apk upgrade &&									\
			apk add nginx 													\
			php7-common php7-iconv php7-json php7-gd php7-curl php7-xml 	\
			php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql 	\
			php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext 		\
			php7-ldap php7-ctype php7-dom 									\
			openrc
#			supervisor

RUN			wget http://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz
RUN			rm latest.tar.gz

COPY		nginx_default /etc/nginx/nginx.conf 
#COPY		supervisor.conf /etc/supervisord.conf
COPY		wp-config.php /var/www/html/wp-config.php

EXPOSE		80

#ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
COPY	openrc.sh /
RUN		chmod +x /openrc.sh
CMD		/openrc.sh
