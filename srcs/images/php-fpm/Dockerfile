FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN set -eux; \
	apk add --no-cache php7-fpm; \
	echo -e "\n; Custom Config for ft_services\n\
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

# add cgi.fix_pathinfo = 0; in php.ini
EXPOSE 9000

CMD ["php-fpm7"]