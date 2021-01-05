FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add openssl vsftpd

RUN openssl req -x509 -nodes -days 720 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
	-out /etc/ssl/certs/vsftpd.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=services/CN=gavno"
COPY       vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 21

RUN			adduser -D lol
RUN			echo 'lol:lol' | chpasswd

#ENTRYPOINT	["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf
