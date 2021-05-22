FROM ft-php-fpm


RUN mkdir -p /work-dir \
	&& wget -q -O - https://github.com/WordPress/WordPress/archive/5.6.tar.gz \
		| tar -xz -C /work-dir/ --strip-components=1

COPY wp-config.php /
