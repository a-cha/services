FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add openssl vsftpd

RUN openssl req -x509 -nodes -days 720 -newkey rsa:2048 -keyout /etc/ssl/private/key.key -out /etc/ssl/certs/crt.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=welease/CN=www.localhost.com"
COPY       vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog
EXPOSE 21
RUN echo 'root:root' | chpasswd

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf