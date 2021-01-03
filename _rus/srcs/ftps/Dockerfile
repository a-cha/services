FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add --no-cache openrc openssl vsftpd

#copy conf
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

#open ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=pcatrina/CN=pcatrina" \
	-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

#add user
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd

EXPOSE 21
COPY ./start.sh /
RUN chmod +x /start.sh
CMD /start.sh

#/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf