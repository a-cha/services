#!/bin/bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/volume.yaml



docker build -t nginx_image srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/mysql-deployment.yaml

docker build -t wordpress_image srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress-deployment.yaml


docker build -t grafana_image srcs/grafana/
kubectl apply -f srcs/grafana/grafana.yaml

docker build -t influxdb_image srcs/influxdb/
kubectl apply -f srcs/influxdb/influxdb.yaml

docker build -t php_image srcs/php
kubectl apply -f srcs/php/phpmyadmin.yaml

docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

minikube dashboard