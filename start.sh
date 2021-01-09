#! /bin/sh

SERVICE_LIST="nginx mysql phpmyadmin wordpress ftps grafana influxdb"

GREEN="\e[0;32m"
PURPLE="\033[35m"
RED="\033[31m"
BLUE='\033[36m'
BOLD="\033[1m"
STD="\033[0m"

Print_message() {
  printf "$1$BOLD%s" "$2"
  echo "$STD"
}

# REMOVE LOGS
if [ "$1" = "clean" ]
then
  rm -f srcs/kustomization_log
  rm -f srcs/minikube_log
  for SERVICE in $SERVICE_LIST
  do
    rm -f srcs/"$SERVICE"/build_log
  done
  Print_message "$GREEN" "All logs was deleted ✅"
  exit
fi

# RUN MINIKUBE
if [ "$1" = 're' ] && [ "$2" = 'kube' ]
then
  Print_message "$RED" "Deleting minikube"
  minikube delete > /dev/null
fi

if [ "$(minikube status | grep -c "Running")" = 0 ]
then
  Print_message "" "Trying to start minikube..."
	{ minikube start --vm-driver=virtualbox > srcs/minikube_log ; } 2>&1
	{ minikube addons enable metallb >> srcs/minikube_log ; } 2>&1
  { kubectl apply -f srcs/configmap.yaml >> srcs/minikube_log ; } 2>&1
  if [ "$(minikube status | grep -c "Running")" != 0 ]
  then
    Print_message "$GREEN" "Minikube launched 😎😎😎"
  else
    Print_message "$RED" "Minikube failed to start 🤦‍♀"
    Print_message "" "Trying again..."
    ./start.sh re kube
  fi
else
  Print_message "$GREEN" "Minikube is running now 😇"
fi

# IF SOME SERVICE NEED TO BE RELOAD
if [ "$1" = 're' ] && [ "$2" != 'kube' ]
then
  printf "$RED$BOLD%s %s" "$2" "configuration removed"
  echo "$STD"
  kubectl delete deploy "$2"-deployment >/dev/null 2>&1
  kubectl delete svc "$2"-service >/dev/null 2>&1
  if [ "$2" = 'mysql' ] || [ "$2" = 'influxdb' ]
  then
    printf "$RED$BOLD%s %s %s" "Removing" "$2" "volume..."
    echo "$STD"
    kubectl delete pvc "$2"-pvc >/dev/null 2>&1
    kubectl delete pv "$2"-pv >/dev/null 2>&1
  fi
fi

# SWITCH DOCKER INTO MINIKUBE
eval "$(minikube docker-env)"

# BUILDING IMAGES
for SERVICE in $SERVICE_LIST
do
  printf "$BOLD%s$PURPLE %s$STD$BOLD %s" "Building" "$SERVICE" "image..."
  echo "$STD"
  docker build -t "$SERVICE"_image srcs/"$SERVICE" > srcs/"$SERVICE"/build_log
done

# APPLY ALL YAML CONFIGURATIONS
Print_message "$BLUE" "Applying yaml configurations 💫"
kubectl apply -k ./srcs > srcs/kustomization_log

# LAUNCH DASHBOARD
if [ "$3" != 'd' ] && [ "$2" != 'd' ] && [ "$1" != 'd' ]
then
  echo ''
  Print_message "$RED" "Launching dashboard 🚀🚀🚀"
	minikube dashboard >/dev/null 2>&1
fi
