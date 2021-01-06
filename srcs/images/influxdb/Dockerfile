FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 


RUN set -eux; \
	apk add --no-cache influxdb;                       \
	echo ok;


VOLUME /var/lib/influxdb
COPY influxdb.conf /etc/influxdb/influxdb.conf

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8086 8088     2003 4242 8089 25826
CMD ["sh"]
# CMD ["influxd"]