#!/bin/sh

set -e

if [ "$$(ls -A /var/www/app)" ]; then
	echo "wordpress already downloaded"
else
	echo "Persistent volume empty, downloading wordpress..."
	wget -q -O - https://github.com/WordPress/WordPress/archive/5.6.tar.gz | tar -xz -C /var/www/app --strip-components=1
	echo "Done."
fi
exec php-fpm7
