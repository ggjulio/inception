FROM alpine:3.13
LABEL maintainer="Julio <juligonz@student.42.fr>"

RUN set -eux; \
	apk add --no-cache php7-fpm php7-mysqli php7-json php7-xml php7-curl \
		php7-zip php7-tokenizer php7-xmlwriter php7-simplexml php7-dom   \
		php7-iconv php7-mbstring php7-gettext php7-session;              \
	echo -e "\n; Custom Config\n\
[global]															\n\
daemonize = no														\n\
error_log = /proc/self/fd/2											\n\
																	\n\
[www]																\n\
; if we send this to /proc/self/fd/1, it never appears				\n\ 
access.log = /proc/self/fd/2'										\n\
listen     = 9000													\n\
clear_env  = no														\n\
																	\n\
; Ensure worker stdout and stderr are sent to the main error log.	\n\
catch_workers_output = yes											\n\
decorate_workers_output = no										\n\
" >> /etc/php7/php-fpm.conf ;

VOLUME /var/www/app/

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 9000
CMD ["php-fpm7"]
