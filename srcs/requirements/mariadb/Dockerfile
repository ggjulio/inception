FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
	&& apk add --no-cache mariadb mariadb-client su-exec\
 	&& addgroup mysql mysql \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /run/mysqld /docker-entrypoint-initdb.d \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
	&& chmod 1777 /var/run/mysqld \
	&& echo -e "\n# Custom Config\n\
[mysqld]									\n\
pid-file        = /run/mysqld/mysqld.pid	\n\
socket          = /run/mysqld/mysqld.sock	\n\
port			= 3306						\n\
datadir			= /var/lib/mysql			\n\
skip-bind-address							\n\
skip-networking	= false						\n\
" >> /etc/my.cnf

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
