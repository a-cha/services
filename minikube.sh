# /bin/sh 

if [[ $1 = 're' ]]
then
	minikube delete
fi

if [ $(minikube status | grep -c "Running") == 0 ] || [[ $1 == 'force' ]]
then
	minikube start --vm-driver=virtualbox
	minikube addons enable metallb
	kubectl apply -f srcs/configmap.yaml
	eval $(minikube docker-env)
	echo "Minikube launched"
else
	echo "Minikube is already running"
fi
