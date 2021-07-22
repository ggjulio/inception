#!/bin/sh

set -e

echo "#######################################"
echo "############  Wordpress  ##############"
echo "#######################################"
if [ "$(ls -A /var/www/app)" ]; then
	echo "wordpress already downloaded"
else
	echo "Persistent volume empty, downloading wordpress..."
	wget -q -O - https://github.com/WordPress/WordPress/archive/5.7.2.tar.gz | tar -xz -C /var/www/app --strip-components=1
	echo "Done."
	cp /requirements/wp-config.php /var/www/app
	chmod -R +rx /var/www/app
	echo "Chmod done."
fi

is_redis_installed="$(wp --path=/var/www/app/  plugin list 2> /dev/null | grep redis-cache || true)"
if [ -z "$is_redis_installed" ]; then
	echo "Installing redis-cache plugin"
	i=30 		# wait 30s maximum
	until wp --path=/var/www/app/  plugin install redis-cache || [ $i -le 0 ]
	do 
		echo "waiting mariadb service to be up"
		sleep 1
		i=$((i - 1))
	done

	is_redis_installed="$(wp --path=/var/www/app/  plugin list 2> /dev/null | grep redis-cache || true)"
	if [ -z "$is_redis_installed" ]; then
		echo "Failed to install redis-plugin !"
		exit 1
	fi
	chmod -R +rx /var/www/app
else
	echo "Redis-cache plugin is already installed"
fi
wp --path=/var/www/app/ plugin activate redis-cache
wp --path=/var/www/app redis enable

exec "$@"
