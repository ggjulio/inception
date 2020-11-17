FROM alpine:3.11

ENV GOSU_VERSION 1.12
RUN set -eux; \
	\
	apk add --no-cache --virtual .gosu-deps \
		ca-certificates \
		dpkg \
		gnupg \
	; \
	\
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	\
# verify the signature
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	command -v gpgconf && gpgconf --kill all || :; \
	rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	\
# clean up fetch dependencies
	apk del --no-network .gosu-deps; \
	\
	chmod +x /usr/local/bin/gosu; \
# verify that the binary works
	gosu --version; \
	gosu nobody true

RUN apk update \
	&& apk add --no-cache mysql mysql-client \
 	&& addgroup mysql mysql \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
	&& chmod 1777 /var/run/mysqld /var/lib/mysql \
	# && mysql_install_db --user=mysql --datadir=/var/lib/mysql \
	&& echo -e "\n# Custom Config for ft_services\n\
[mysqld]							\n\
port			= 3306				\n\
datadir			= /var/lib/mysql	\n\
skip-bind-address					\n\
skip-networking	= false				\n\
" >> /etc/my.cnf

# USER mysql

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin

EXPOSE 3306
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]

# mysql -h 127.0.0.1 -P 3306 -protocol=tcp -u groot -p
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'groot'@'172.%' IDENTIFIED BY 'icantstopthisfeelingdeepinsideofme' WITH GRANT OPTION;
