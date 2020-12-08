#!/usr/bin/bash

minikube start --vm-driver=docker --cpus=2 --memory=3900

minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard

IP=$(minikube ip)
eval $(minikube docker-env)

docker build -t my-nginx srcs/images/nginx/ > /dev/null
docker build -t my-mysql srcs/images/mysql/ > /dev/null

kubectl apply --filename srcs/k8s_objects/

# minikube dashboard

printf "cluster ip : %s" $IP
