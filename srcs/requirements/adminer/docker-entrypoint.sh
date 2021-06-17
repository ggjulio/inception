#!/bin/sh

set -e

if [ "$(ls -A /var/www/app)" ]; then
	echo "adminer already downloaded"
else
	echo "Persistent volume empty, downloading adminer..."
	wget -O /var/www/app/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
	echo "Done."
fi

exec "$@"
