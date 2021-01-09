#! /bin/sh

GREEN="\e[0;32m"
PURPLE="\033[35m"
RED="\033[31m"
BLUE='\033[36m'
BOLD="\033[1m"
STD="\033[0m"

# FUNCTIONS FOR PRINTING MESSAGES
Kube_message() {
  printf "$1$BOLD%s" "$2"
  echo "$STD"
}

Build_message() {
  printf "$BOLD%s$PURPLE %s$STD$BOLD %s" "Building" "$1" "image..."
  echo "$STD"
}

# REMOVE LOGS
SERVICE_LIST="nginx mysql phpmyadmin wordpress ftps grafana"
if [ "$1" = "clean" ]
then
  rm -f srcs/kustomization_log
  for SERVICE in $SERVICE_LIST
  do
    rm -f srcs/"$SERVICE"/build_log
  done
  printf "$GREEN$BOLD%s\n" "All logs was deleted ✅"
  exit
fi

# RUN MINIKUBE
if [ "$1" = 're' ] && [ "$2" = 'kube' ]
then
  printf "$RED$BOLD%s" "Deleting minikube"
  echo "$STD"
  minikube delete > /dev/null
fi

if [ "$(minikube status | grep -c "Running")" = 0 ]
then
  printf "$BOLD%s" "Trying to start minikube..."
  echo "$STD"
	{ minikube start --vm-driver=virtualbox > srcs/minikube_log ; } 2>&1
	{ minikube addons enable metallb >> srcs/minikube_log ; } 2>&1
  { kubectl apply -f srcs/configmap.yaml >> srcs/minikube_log ; } 2>&1
  if [ "$(minikube status | grep -c "Running")" != 0 ]
  then
    Kube_message "$GREEN" "Minikube launched 😎😎😎"
  else
    Kube_message "$RED" "Minikube failed to start 🤦‍♀"
    printf "$BOLD%s" "Trying again..."
    echo "$STD"
    ./start.sh re kube
  fi
else
  Kube_message "$GREEN" "Minikube is running now 😇"
fi

# IF SOME SERVICE NEED TO BE RELOAD
if [ "$1" = 're' ] && [ "$2" != 'kube' ]
then
  printf "$RED$BOLD%s %s %s" "Removing" "$2" "configuration"
  echo "$STD"
  kubectl delete deploy "$2"-deployment
  kubectl delete svc "$2"-service
  if [ "$2" = 'mysql' ] || [ "$2" = 'influx' ]
  then
    printf "$RED$BOLD%s %s %s" "Removing" "$2" "volume..."
    echo "$STD"
    kubectl delete pvc "$2"-pvc
    kubectl delete pv "$2"-pv
  fi
fi

# SWITCH DOCKER INTO MINIKUBE
eval "$(minikube docker-env)"

# BUILDING IMAGES
for SERVICE in $SERVICE_LIST
do
  Build_message "$SERVICE"
  docker build -t "$SERVICE"_image srcs/"$SERVICE" > srcs/"$SERVICE"/build_log
done

printf "$BOLD$BLUE%s" "Applying yaml configurations 💫"
echo "$STD"

# APPLY ALL YAML CONFIGURATIONS
kubectl apply -k ./srcs > srcs/kustomization_log

# LAUNCH DASHBOARD
if [ "$3" != 'd' ] && [ "$2" != 'd' ] && [ "$1" != 'd' ]
then
  echo ''
  printf "$RED$BOLD%s" "Launching dashboard 🚀🚀🚀"
  echo "$STD"
	minikube dashboard &>/dev/null
fi
