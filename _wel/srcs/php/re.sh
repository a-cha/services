kubectl delete deploy phpmyadmin
kubectl delete svc phpmyadmin-svc
docker build -t php_image .
kubectl apply -f phpmyadmin.yaml
