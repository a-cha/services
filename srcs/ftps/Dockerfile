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

FROM		alpine:3.7
LABEL		maintainer="sadolph"

RUN			apk update &&													\
			apk add vsftpd													\
			openssl

RUN			adduser -D sadolph
RUN			echo "sadolph:sadolph" | chpasswd

COPY		vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN			mkdir -p /var/log/ftp
RUN			touch /var/log/ftp/xferlog.log

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
			-keyout /etc/ssl/private/vsftpd.key 							\
			-out /etc/ssl/certs/vsftpd.crt 									\
			-subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=4th Wave/CN=sadolph"

EXPOSE		21

ENTRYPOINT	["vsftpd", "/etc/vsftpd/vsftpd.conf"]
