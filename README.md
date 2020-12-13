# ft_services

- http://phusion.github.io/baseimage-docker/
- https://medium.com/@codingwithmanny/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6
- https://hub.docker.com/_/nginx
- https://hub.docker.com/_/mysql   
- https://wiki.alpinelinux.org/wiki/MariaDB   
- https://mariadb.com/kb/en/running-mysqld-as-root/    
- https://cloud.google.com/solutions/best-practices-for-building-containers
- https://cloud.google.com/solutions/best-practices-for-operating-containers
- https://rtfm.co.ua/en/kubernetes-clusterip-vs-nodeport-vs-loadbalancer-services-and-ingress-an-overview-with-examples/ 

- https://medium.com/kubernetes-costa-rica/kubernetes-nodeport-vs-loadbalancer-vs-ingress-cuando-usar-cu%C3%A1l-5930df5619c



- https://github.com/kelseyhightower/kubernetes-the-hard-way

- https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df
- https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe  
- https://www.redhat.com/cms/managed-files/cm-oreilly-kubernetes-patterns-ebook-f19824-201910-en.pdf
- http://www.projectatomic.io/docs/docker-image-author-guidance/

#### dockerfile : Entrypoints + CMDs + Signals and processes
- https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts
- https://stackoverflow.com/questions/32255814/what-purpose-does-using-exec-in-docker-entrypoint-scripts-serve/32261019#32261019
- https://stackoverflow.com/questions/50898134/what-does-docker-stopsignal-do
- https://hynek.me/articles/docker-signals/
- https://ubuntu.com/blog/avoiding-dropped-connections-in-nginx-containers-with-stopsignal-sigquit
- https://stackoverflow.com/questions/36781372/docker-using-gosu-vs-user
- https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- https://stackoverflow.com/questions/50319492/difference-between-and-set-ex-in-dockerfiles
- https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
- https://github.com/koalaman/shellcheck/issues/1489
- https://coderwall.com/p/fkfaqq/safer-bash-scripts-with-set-euxo-pipefail
- https://www.freebsd.org/cgi/man.cgi?query=sh&sektion=&n=1
- https://stackoverflow.com/questions/40547032/bash-read-returns-with-exit-code-1-even-though-it-runs-as-expected
#### MYSQL

- https://hub.docker.com/_/mysql
- https://github.com/docker-library/mysql/blob/master/8.0/Dockerfile
- https://github.com/docker-library/mariadb/blob/master/10.5/Dockerfile
- https://github.com/docker-library/mysql/blob/master/8.0/docker-entrypoint.sh
- https://github.com/docker-library/mariadb/blob/master/10.5/docker-entrypoint.sh
- https://mariadb.com/kb/en/installing-system-tables-mysql_install_db/
- https://dev.mysql.com/doc/refman/5.6/en/mysql-install-db.html
- https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/
- https://stackoverflow.com/questions/14779104/mysql-how-to-allow-remote-connection-to-mysql
- https://success.mirantis.com/article/use-a-script-to-initialize-stateful-container-data
- https://unix.stackexchange.com/questions/265149/why-is-set-o-errexit-breaking-this-read-heredoc-expression/265151

#### pod : php + nginx
- https://medium.com/@marekbartik/autoscale-nginx-and-php-fpm-independently-on-google-kubernetes-engine-290aead64f7f
- https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-architecture
- https://cloud.google.com/kubernetes-engine/docs/tutorials/persistent-disk
- https://github.com/kubernetes/examples
- https://cloud.google.com/endpoints/docs/openapi/custom-nginx
- https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
- https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/
## configmap and volume to avoid custom image
- https://cloud.google.com/endpoints/docs/openapi/custom-nginx
- https://stackoverflow.com/questions/64178370/custom-nginx-conf-from-configmap-in-kubernetes
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#populate-a-volume-with-data-stored-in-a-configmap
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#populate-a-volume-with-data-stored-in-a-configmap
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#add-configmap-data-to-a-specific-path-in-the-volume