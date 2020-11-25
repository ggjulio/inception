#!/bin/sh

set -eo pipefail

export	DATADIR=/var/lib/mysql
export	SOCKET=/run/mysqld/mysqld.sock

logging(){
	local type=$1; shift
	printf 'Entrypoint [%s] : %b\n' "$type" "$*"
}
log_info(){
	logging 'info' "$@"
}
log_error(){
	logging 'error' "$@"
	exit 1
}

temp_server_start(){

	mysqld --skip-networking --socket="${SOCKET}" &
	log_info 'Waiting server  startup'
	# count from 1 to 30
	A=0
	while [ $A -le 30 ]; do
		echo "$A : "
		echo "SELECT 1;" | mysql
		if [ -z $? ]; then
			log_info 'break>>>>>>>>>>>>>>>>>'
			break
		fi
		sleep 1
		A=$(expr $A + 1)
	done

}

temp_server_stop(){
	log_info "Stopping temporary server"
	if ! mysqladmin --defaults-extra-file=<<-EOF shutdown -ugroot --socket="${SOCKET}"; then
		[client]
		password=${MYSQL_GROOT_PASSWORD}
		EOF
		log_error "Unable to shutdown server"
	fi
	log_info "Temporary server stopped"
}

setup_db(){
	# Sets groot password and creates root users for non-localhost hosts
	local grootCreate=
	read -r -d '' grootCreate <<-EOF || true
		CREATE USER 'root'@'${MYSQL_ROOT_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
		GRANT ALL ON *.* TO 'root'@'${MYSQL_ROOT_HOST}' WITH GRANT OPTION ;
	EOF

	log_info "Creating.........."
	mysql           <<-EOF

		FLUSH PRIVILEGES;
		${grootCreate}
		DROP DATABASE IF EXISTS test;
	EOF

}


# Exit if one variable is missing :
	# MYSQL_GROOT_HOST		= 172.%
	# MYSQL_GROOT_PASSWORD	= icantstopthisfeelingdeepinsideofme
	# MYSQL_DATABASE		= wordpress
	# MYSQL_USER			= wordpress
	# MYSQL_PASSWORD		= wordpress

if [ "$1" = "mysqld" ]; then
	log_info "Entrypoint script for mysql server started..."
	if [ -z "$MYSQL_GROOT_HOST" -o -z "$MYSQL_GROOT_PASSWORD" -o -z "$MYSQL_DATABASE" -o -z "$MYSQL_USER" -o -z "$MYSQL_PASSWORD" ]; then
		log_error "Missing one of theses environment variables :\n\tMYSQL_GROOT_HOST\n\tMYSQL_GROOT_PASSWORD\n\tMYSQL_DATABASE\n\tMYSQL_USER\n\tMYSQL_PASSWORD"
	fi

	if [ "$(id -u)" = "0" ]; then
		log_info "Switch from root to user mysql"
		chown -R mysql:mysql /var/lib/mysql
		exec su-exec mysql "$0" "$@"
	fi

#	if [ ! -d $DATADIR/mysql ]; then		# if there is no database, initialize database directory ( == if first time container run...)
		log_info 'Initialize mysql database (at first startup only)'
		mysql_install_db --datadir=$DATADIR > /dev/null
		log_info 'Mysql init done.'
		temp_server_start
		setup_db
		temp_server_stop

#	else
#		log_info 'Skipping initialization. Mysql database already created.'
#	fi

fi
exec "$@"

