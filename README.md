# ft_services

- http://phusion.github.io/baseimage-docker/
- https://medium.com/@codingwithmanny/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6
- https://hub.docker.com/_/nginx
- https://hub.docker.com/_/mysql   
- https://wiki.alpinelinux.org/wiki/MariaDB   
- https://mariadb.com/kb/en/running-mysqld-as-root/    
- https://cloud.google.com/solutions/best-practices-for-building-containers
- https://rtfm.co.ua/en/kubernetes-clusterip-vs-nodeport-vs-loadbalancer-services-and-ingress-an-overview-with-examples/ 


- https://medium.com/kubernetes-costa-rica/kubernetes-nodeport-vs-loadbalancer-vs-ingress-cuando-usar-cu%C3%A1l-5930df5619c

Problemes sujet :
nginx + php dans meme container.   
minikube non specifie dans le sujet.   


https://github.com/kelseyhightower/kubernetes-the-hard-way

https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df
https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe  

#### dockerfile : Entrypoints + CMDs + Signals and processes
https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
https://stackoverflow.com/questions/32255814/what-purpose-does-using-exec-in-docker-entrypoint-scripts-serve/32261019#32261019
https://stackoverflow.com/questions/50898134/what-does-docker-stopsignal-do
https://hynek.me/articles/docker-signals/
https://ubuntu.com/blog/avoiding-dropped-connections-in-nginx-containers-with-stopsignal-sigquit
https://stackoverflow.com/questions/36781372/docker-using-gosu-vs-user
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
#### MYSQL

https://hub.docker.com/_/mysql
https://github.com/docker-library/mysql/blob/master/5.6/Dockerfile
https://github.com/docker-library/mysql/blob/master/5.6/docker-entrypoint.sh
https://mariadb.com/kb/en/installing-system-tables-mysql_install_db/
https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html
https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/
https://stackoverflow.com/questions/14779104/mysql-how-to-allow-remote-connection-to-mysql
https://success.mirantis.com/article/use-a-script-to-initialize-stateful-container-data