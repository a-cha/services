#! /bin/sh

GREEN="\e[0;32m"
PURPLE="\033[35m"
BLUE='\033[36m'
BOLD="\033[1m"
STD="\033[0m"

Kube_message() {
  printf "$1$BOLD%s\n" "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  printf "@ %s @\n" "$2"
  printf "%s$STD\n" "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  sleep 1
}

Img_message() {
  printf "$PURPLE$BOLD%s" "Starting to build images"
  sleep 1
  printf .
  sleep 1
  printf .
  sleep 1
  printf .
  echo "$STD"
}

if [ "$1" = 're' ] && [ "$2" = 'kube' ]
then
  minikube delete
fi

if [ "$(minikube status | grep -c "Running")" = 0 ] || [ "$1" = 'force' ]
then
	minikube start --vm-driver=virtualbox
	minikube addons enable metallb
  kubectl apply -f srcs/configmap.yaml
  Kube_message "$GREEN" "         Minikube launched 😎😎😎        "
  Img_message
else
  Kube_message "$GREEN" "      Minikube is already running 😇     "
	Img_message
fi

eval "$(minikube docker-env)"

if [ "$1" = 're' ]
then
  if [ "$2" = 'nginx' ]
  then
    kubectl delete deploy nginx-deployment
    kubectl delete svc nginx-service
  fi
  if [ "$2" = 'mysql' ]
  then
    kubectl delete deploy mysql-deployment
    kubectl delete svc mysql-service
    kubectl delete pvc --all
    kubectl delete pv --all
  fi
  if [ "$2" = 'php' ]
  then
    kubectl delete deploy php-deployment
    kubectl delete svc php-service
  fi
  if [ "$2" = 'wp' ]
  then
    kubectl delete deploy wordpress-deployment
    kubectl delete svc wordpress-service
  fi
  if [ "$2" = 'ftps' ]
  then
    kubectl delete deploy ftps-deployment
    kubectl delete svc ftps-service
  fi
  if [ "$2" = 'grafana' ]
  then
	kubectl delete deploy grafana-deployment
	kubectl delete svc grafana-service
	fi
  if [ "$2" = 'influx' ]
  then
	kubectl delete deploy influx-deployment
	kubectl delete svc influx-service
  kubectl delete pvc --all
  kubectl delete pv --all
	fi
  if [ "$2" = 'all' ]
  then
    ./start.sh re nginx
    ./start.sh re mysql
    ./start.sh re php
    ./start.sh re wp
    ./start.sh re ftps
    ./start.sh re grafana
    ./start.sh re influx
	fi
fi


docker build -t nginx_image srcs/nginx
docker build -t mysql_image srcs/mysql
docker build -t php_image srcs/phpmyadmin
docker build -t wordpress_image srcs/wordpress
docker build -t ftps_image srcs/ftps
docker build -t grafana_image srcs/grafana
#docker build -t influx_image srcs/influxdb

Kube_message "$BLUE" "     Applying yaml configurations 💫     "
sleep 1

kubectl apply -k ./srcs

if [ "$1" != 'd' ] && [ "$2" != 'd' ] && [ "$3" != 'd' ]
then
	minikube dashboard
fi
