#!/bin/bash

set -euxo pipefail

###################### CLEAN VM #############################
eval $(minikube docker-env --unset)                         #
minikube delete                                             #
docker network prune --force                                # 
if [ "${1-0}" = "delete" -o "${1-0}" = "clean" ]; then		#
	exit 0;													#
fi															#
#############################################################

minikube start --vm-driver=docker --memory 3100   --bootstrapper=kubeadm
minikube addons enable metrics-server
minikube addons enable dashboard
# Allow connection to k8s api... for the telegraf inputs.kubernetes plugin
kubectl create clusterrolebinding node-admin-default-svc --clusterrole=cluster-admin --serviceaccount=default:default


#############################################################
######## build images inside minikube  container ############
eval $(minikube docker-env)
docker build -t my-telegraf srcs/images/telegraf > /dev/null
docker build -t my-nginx srcs/images/nginx/ > /dev/null
docker build -t my-mysql srcs/images/mysql/ > /dev/null
docker build -t my-php-fpm srcs/images/php-fpm/ > /dev/null
docker build -t my-influxdb srcs/images/influxdb > /dev/null
docker build -t my-grafana srcs/images/grafana > /dev/null
docker build -t my-ftps srcs/images/ftps > /dev/null
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
kubectl apply --filename srcs/k8s_objects/grafana.yaml
kubectl apply --filename srcs/k8s_objects/phpmyadmin.yaml
kubectl apply --filename srcs/k8s_objects/ftps.yaml
kubectl apply --filename srcs/k8s_objects/secrets.yaml
kubectl apply --filename srcs/k8s_objects/influxdb.yaml
kubectl apply --filename srcs/k8s_objects/mysql.yaml
kubectl apply --filename srcs/k8s_objects/telegrafDaemonSet.yaml
#kubectl apply --filename srcs/k8s_objects/

minikube dashboard &

watch -n 0 kubectl get all
echo "To clean everything, use ./setup clean"