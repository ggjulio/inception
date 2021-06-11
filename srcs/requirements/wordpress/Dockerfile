FROM ft-php-fpm

RUN mkdir -p /var/www/app \
	&& wget -q -O - https://github.com/WordPress/WordPress/archive/5.6.tar.gz \
		| tar -xz -C /var/www/app --strip-components=1

# COPY wp-config.php /var/www/app
COPY wp-config.php /requirements/wp-config.php
