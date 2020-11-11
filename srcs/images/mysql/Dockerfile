FROM alpine:3.11

RUN apk update \
	&& apk add --no-cache mysql                                   mysql-client\
 	&& addgroup mysql mysql \
	&& mkdir -p /run/mysqld

RUN mysql_install_db --datadir=/var/lib/mysql
	# && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY custom.cnf /etc/my.cnf.d/z.cnf

VOLUME /var/lib/mysql
EXPOSE 3306
# USER mysql

CMD ["mysqld", "user=root"]
