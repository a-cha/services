# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matrus <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 10:23:09 by matrus            #+#    #+#              #
#    Updated: 2020/09/30 13:11:25 by matrus           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/sh

function fail_exit {
	echo_red "---FAILED---"
	minikube delete
	exit 1
}

function echo_red {
	echo "\x1b[31;47m$1\x1b[0m"
}

function echo_blue {
	echo "\x1b[34;47m$1\x1b[0m"
}

echo_blue "---STARTING MINIKUBE---"
minikube start --vm-driver=virtualbox					|| fail_exit

echo_blue "---ENABLING METALLB ADDON---"
minikube addons enable metallb							|| fail_exit

echo_blue "---APPLYING METALLB CONFIG---"
kubectl apply -f srcs/metallb/metallb_config.yaml		|| fail_exit

echo_blue "---CHANGING DOCKER ENVIRONMENT---"
eval $(minikube docker-env)								|| fail_exit


echo_blue "---BUILDING WORDPRESS CONTAINER---"
docker build -t wordpress:matrus ./srcs/wordpress		|| fail_exit

echo_blue "---APPLYING WORDPRESS.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/wordpress/wordpress.yaml		|| fail_exit


echo_blue "---BUILDING MYSQL CONTAINER---"
docker build -t mysql:matrus ./srcs/mysql				|| fail_exit

echo_blue "---APPLYING MYSQL PERSISTENT VOLUME TO KUBERNETES---"
kubectl apply -f ./srcs/mysql/pv.yaml					|| fail_exit

echo_blue "---APPLYING MYSQ.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/mysql/mysql.yaml				|| fail_exit


echo_blue "---BUILDING PHPMYADMIN CONTAINER---"
docker build -t phpmyadmin:matrus ./srcs/phpma			|| fail_exit

echo_blue "---APPLYING PHPMYADMIN.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/phpma/phpmyadmin.yaml			|| fail_exit


echo_blue "---BUILDING NGINX CONTAINER---"
docker build	-t nginx:matrus ./srcs/nginx/			|| fail_exit

echo_blue "---APPLYING NGINX.YAML TO KUBERNETES---"
kubectl apply	-f ./srcs/nginx/nginx.yaml				|| fail_exit


echo_blue "---BUILDING FTPS CONTAINER---"
docker build -t ftps:matrus ./srcs/ftps					|| fail_exit

echo_blue "---APPLYING FTPS.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/ftps/ftps.yaml					|| fail_exit


echo_blue "---BUILDING INFLUXDB CONTAINER---"
docker build -t influxdb:matrus ./srcs/influxdb			|| fail_exit

echo_blue "---APPLYING INFLUXDB PERSISTENT VOLUME TO KUBERNETES---"
kubectl apply -f ./srcs/influxdb/pv.yaml				|| fail_exit

echo_blue "---APPLYING INFLUXDB.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/influxdb/influxdb.yaml			|| fail_exit


echo_blue "---BUILDING GRAFANA CONTAINER---"
docker build -t grafana:matrus ./srcs/grafana			|| fail_exit

echo_blue "---APPLYING GRAFANA.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/grafana/grafana.yaml			|| fail_exit
