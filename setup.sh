#!/usr/bin/bash

minikube start --vm-driver=docker --cpus=2 --memory=3900

minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard

IP=$(minikube ip)
eval $(minikube docker-env)

echo "nginx"
docker build -t my-nginx srcs/images/nginx/ > /dev/null
echo "mysql"
docker build -t my-mysql srcs/images/mysql/ > /dev/null
echo "fpm"
docker build -t my-php-fpm srcs/images/php-fpm/ > /dev/null
echo "done images"

kubectl apply --filename srcs/k8s_objects/configMap-metallb.yaml
kubectl apply --filename srcs/k8s_objects/nginx.yaml
#kubectl apply --filename srcs/k8s_objects/

# minikube dashboard

printf "cluster ip : %s" $IP
