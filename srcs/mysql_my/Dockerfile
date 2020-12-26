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

RUN			apk update && apk add 						\
			mysql 										\
			mysql-client 								\
			openrc
#			mysql-server

VOLUME 		[ "/sys/fs/cgroup" ]
VOLUME		[ "/var/lib/mysql" ]

RUN			chmod 755 /var/lib/mysql
RUN			mkdir -p /run/mysqld/
RUN			touch /run/mysqld/mysqld.sock
RUN			chmod 755 /run/mysqld/mysqld.sock
RUN			chown mysql /run/mysqld/mysqld.sock
RUN			chmod -R 755 /run
COPY		my.cnf /etc/mysql/
COPY		wordpress_db.sql /etc
COPY		init_db.sql /etc

#RUN			chown -R mysql:mysql /var/lib/mysql
COPY		start.sh /
RUN			chmod +x start.sh

EXPOSE		3306

ENTRYPOINT	sh start.sh
