FROM alpine:3.7

LABEL maintainer=matrus

RUN apk add --update vsftpd && \
	touch /var/log/vsftpd.log

RUN echo "root:root" | chpasswd;

COPY vsftpd.conf /etc/vsftpd/
COPY matrus_services.crt /etc/vsftpd/matrus_services.crt
COPY matrus_services.key /etc/vsftpd/matrus_services.key

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
