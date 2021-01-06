#!/bin/sh

set -e

export	DATADIR=/var/lib/influxdb
export	META_DIR=$DATADIR/meta


BOLD="\e[1m"
RESET="\e[0m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_CYAN="\e[96m"

logging(){
	local type=$1; shift
	printf "${LIGHT_CYAN}${BOLD}Entrypoint${RESET} [%b] : %b\n" "$type" "$*"
}
log_info(){
	logging "${LIGHT_GREEN}info${RESET}" "$@"
}
log_error(){
	logging "${LIGHT_RED}error${RESET}" "$@" >&2
	exit 1
}

temp_server_start(){
	influxd &
	PID_TMP_SERVER="$!"
	log_info 'Waiting server  startup'
	i=30 		# wait 30s maximum
	while [ $i -gt 0 ]; do
		has_started="$(influx -execute "SHOW DATABASES"  2> /dev/null || true)"
		if [ "$has_started" ]; then
			break
		fi
		sleep 1
		i=$((i - 1))
	done
	if [ "$i" = "0" ]; then
		log_error 'Unable to start server.'
	fi
	log_info 'Server started.'
}

temp_server_stop(){
	log_info "Stopping temporary server"
	if ! kill -s TERM "$PID_TMP_SERVER" || ! wait "$PID_TMP_SERVER" ; then
		log_error "Failed. Unable to shutdown server"
	fi
	log_info "Temporary server stopped"
}

setup_db(){
	log_info 'setup....'
	local setup=
	read -r -d '' setup <<-EOF || true
		CREATE USER "$INFLUXDB_ADMIN_USER" WITH PASSWORD '$INFLUXDB_ADMIN_PASSWORD' WITH ALL PRIVILEGES
		CREATE DATABASE $INFLUXDB_DB
		CREATE USER "$INFLUXDB_USER" WITH PASSWORD '$INFLUXDB_USER_PASSWORD'
		REVOKE ALL PRIVILEGES FROM "$INFLUXDB_USER"
		GRANT ALL ON "$INFLUXDB_DB" TO "$INFLUXDB_USER"
	EOF
	influx -execute "$setup"
	log_info 'done.'
}


# if [ "$1" = "influxd" ]; then
	log_info "Entrypoint script for influxdb server started..."
	if [ -z "$INFLUXDB_DB" -o -z "$INFLUXDB_ADMIN_USER" -o -z "$INFLUXDB_ADMIN_PASSWORD" -o -z "$INFLUXDB_USER" -o -z "$INFLUXDB_USER_PASSWORD" ]; then
		log_error "Missing one of theses environment variables :\n\tINFLUXDB_DB\n\tINFLUXDB_ADMIN_USER\n\tINFLUXDB_ADMIN_PASSWORD\n\tINFLUXDB_USER\n\tINFLUXDB_USER_PASSWORD"
	fi

	if [ ! "$(ls -d "$META_DIR" 2>/dev/null)" ]; then		
		log_info 'Initialize mysql database (at first startup only)'
		temp_server_start
	 	setup_db
		temp_server_stop
		log_info 'Influxdb init done.'
	else
		log_info 'Skipping initialization. Influxdb database already created.'
	fi
	log_info 'Ready for startup\n'
# fi
# exec "$@"
sh
