FROM alpine:latest

RUN apk update
RUN apk add nginx openssl openrc supervisor openssh sudo


RUN mkdir -p /run/nginx
RUN mkdir /var/run/sshd

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY localhost.conf /etc/nginx/conf.d/
COPY index.html /var/www/
COPY supervisord.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 90 \
            -nodes \
            -out localhost.crt \
            -keyout localhost.key \
            -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=welease/CN=www.localhost.com"

RUN adduser -D welease && echo 'welease:root' | chpasswd && addgroup welease wheel && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
&& /usr/bin/ssh-keygen -A

EXPOSE 80 443 22

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]