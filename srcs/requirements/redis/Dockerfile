FROM alpine:3.13
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
	&& apk add --no-cache redis su-exec \
	&& addgroup redis redis \
	&& mkdir -p /data \
	&& chown -R redis:redis /data \
	&& echo -e "\n# Custom Config		\n\
maxmemory 256mb							\n\
maxmemory-policy allkeys-lru			\n\
protected-mode no						\n\
										\n\
" > /etc/redis.conf


VOLUME /data

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server", "/etc/redis.conf"]
