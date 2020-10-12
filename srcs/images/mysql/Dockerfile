FROM alpine:3.11

RUN apk update \
	&& apk add --no-cache mysql \
	&& mkdir -p /run/mysqld \
	&& addgroup mysql mysql \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& mysql --user=mysql



EXPOSE 3306

CMD ["mysqld"]
