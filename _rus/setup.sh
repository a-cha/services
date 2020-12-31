# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcatrina <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/20 22:20:46 by pcatrina          #+#    #+#              #
#    Updated: 2020/11/20 22:20:49 by pcatrina         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
minikube status
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./srcs/configmap.yaml
#mysql
kubectl delete svc mysql-svc
sleep 2
kubectl delete deploy mysql-deployment
sleep 2
docker build -t mysql_image ./srcs/mysql/.
kubectl apply -f ./srcs/mysql-deployment.yaml
#nginx
kubectl delete svc nginx-svc
sleep 2
kubectl delete deploy nginx-deployment
sleep 2
docker build -t nginx_image ./srcs/nginx/.
kubectl apply -f ./srcs/nginx-deployment.yaml
#phpmyadmin
kubectl delete svc phpmyadmin-svc
sleep 2
kubectl delete deploy phpmyadmin-deployment
sleep 2
docker build -t phpmyadmin_image ./srcs/phpmyadmin/.
kubectl apply -f ./srcs/phpmyadmin-deployment.yaml
#wordpress
kubectl delete svc wordpress-svc
sleep 2
kubectl delete deploy wordpress-deployment
sleep 2
docker build -t wordpress_image ./srcs/wordpress/.
kubectl apply -f ./srcs/wordpress-deployment.yaml
#ftps
kubectl delete svc ftps-svc
sleep 2
kubectl delete deploy ftps-deployment
sleep 2
docker build -t ftps_image ./srcs/ftps/.
kubectl apply -f ./srcs/ftps-deployment.yaml
#influxdb
kubectl delete svc influxdb-svc
sleep 2
kubectl delete deploy influxdb-deployment
sleep 2
docker build -t influxdb_image ./srcs/influxdb/.
kubectl apply -f ./srcs/influx-config.yaml
kubectl apply -f ./srcs/influxdb-deployment.yaml
#grafana
kubectl delete svc grafana-svc
sleep 2
kubectl delete deploy grafana-deployment
sleep 2
docker build -t grafana_image ./srcs/grafana/.
kubectl apply -f ./srcs/grafana-deployment.yaml
#telegraf
kubectl delete svc telegraf-svc
sleep 2
kubectl delete deploy telegraf-deployment
sleep 2
docker build -t telegraf_image ./srcs/telegraf/.
kubectl apply -f ./srcs/telegraf-deployment.yaml
minikube dashboard

# # ssh admin@192.168.99.104
# kubectl exec deploy/ftps-deployment -- pkill vsftpd
# kubectl exec deploy/influxdb-deployment -- pkill influxdb
# kubectl exec deploy/wordpress-deployment -- pkill nginx
# kubectl exec deploy/phpmyadmin-deployment -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin-deployment -- pkill nginx
# kubectl exec deploy/mysql-deployment -- pkill /usr/bin/mysqld
# kubectl exec deploy/wordpress-deployment -- pkill php-fpm7
# kubectl exec deploy/nginx-deployment -- pkill /usr/sbin/sshd
# kubectl exec deploy/nginx-deployment -- pkill nginx
