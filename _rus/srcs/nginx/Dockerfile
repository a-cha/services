FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add --no-cache nginx openrc openssl openssh

#copy conf
COPY ./nginx-conf /etc/nginx/conf.d/default.conf

#open ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=pcatrina/CN=pcatrina" -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

#open ssh
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
RUN ssh-keygen -A

#init
RUN mkdir -p /run/nginx
COPY ./index.html /

EXPOSE 80 443 22
COPY ./start.sh /
RUN chmod +x /start.sh
CMD /start.sh