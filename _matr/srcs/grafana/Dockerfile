FROM alpine:latest

LABEL maintainer=matrus

RUN apk add --update supervisor

ADD grafana-7.2.0.linux-amd64.tar.gz /etc/

RUN cp /etc/grafana-7.2.0/conf/defaults.ini /etc/grafana.ini && \
	mkdir /etc/grafana-7.2.0/data

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add glibc-2.32-r0.apk

COPY grafana.db /etc/grafana-7.2.0/data/

EXPOSE 3000

WORKDIR /etc/grafana-7.2.0/bin 

CMD ["./grafana-server"]

