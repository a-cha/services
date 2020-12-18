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
			apk add vsftpd													\
			openssl

COPY		vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY		start.sh /project/

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
			-keyout /etc/ssl/private/vsftpd.key 								\
			-out /etc/ssl/certs/vsftpd.pem 									\
			-subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=4th Wave/CN=sadolph"

EXPOSE		20 420 21
RUN			chmod 755 start.sh

ENTRYPOINT	sh start.sh
