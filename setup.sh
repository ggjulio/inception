#!/usr/bin/bash

set -euxo pipefail

###################### CLEAN VM #############################
eval $(minikube docker-env --unset)                         #
minikube delete                                             #
docker network prune --force                                # 
#############################################################


minikube start --vm-driver=docker
minikube addons enable metrics-server
minikube addons enable dashboard


#############################################################
######## build images inside minikube  container ############
eval $(minikube docker-env)
docker build -t my-nginx srcs/images/nginx/ > /dev/null
docker build -t my-mysql srcs/images/mysql/ > /dev/null
docker build -t my-php-fpm srcs/images/php-fpm/ > /dev/null
eval $(minikube docker-env --unset)

#############################################################
########### set up metallb and networking ###################
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
kubectl apply --filename srcs/k8s_objects/configMap-metallb.yaml
# Create a network for externals ip
docker network create --subnet=172.20.0.0/16 my-net
docker network connect my-net minikube


kubectl apply --filename srcs/k8s_objects/nginx.yaml
kubectl apply --filename srcs/k8s_objects/wordpress.yaml
#kubectl apply --filename srcs/k8s_objects/

minikube dashboard

