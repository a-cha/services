FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing

COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml
COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

COPY ./FT_SERVICE-1605816702189.json /var/lib/grafana/dashboards/

#init
COPY ./start.sh /
RUN chmod +x /start.sh
EXPOSE 3000
CMD ./start.sh
#cd /usr/share/grafana && /usr/sbin/grafana-server