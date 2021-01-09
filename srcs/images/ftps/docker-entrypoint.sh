#!/bin/sh

set -eo pipefail 

if [ -z "$USER" -o -z "$PASSWORD"  ]; then
	echo -e 'Failed : Missing variable $USER or $PASSWORD\nuser name should be lower case only, and without symbols.'
	exit 1
fi
if [ -z $(id -u "$USER" 2> /dev/null) ]; then
	adduser -D --shell /bin/ash "$USER" "$USER"
	echo "user $USER created"
	echo "$USER:$PASSWORD" | chpasswd
	mkdir -p /ftps_data/
	chmod 770 -R /ftps_data
	chown -R $USER /ftps_data
	chgrp -R $USER /ftps_data

	mkdir -p /var/log/vsftpd
	touch /var/log/vsftpd/vsftpd.log
else
	echo 'user already exist, skip user creation'
fi

# Log issue, redirection to stdout : https://github.com/million12/docker-vsftpd/pull/8
# tail -f /var/log/vsftpd/vsftpd.log | tee /dev/stdout &
# ln -sf /dev/stdout /var/log/vsftpd/vsftpd.log 
# exec "$@" running vsftpd as PID 1 provoke crash of vsftpd process while disconneted.
"$@"
