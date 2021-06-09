#!/bin/sh

set -e

log_info(){
	logging "${LIGHT_GREEN}info${RESET}" "$@"
}

# if first arg is not a command, it's either an option, file/dir or a mispelled word.
# thus prepend `redis` command
if [ ! $(command -v "$1" &> /dev/null) ]; then
	set -- redis-server "$@"
fi


if [ "$1" = "mysqld" ]; then

	if [ "$(id -u)" = "0" ]; then
		log_info "Switch from root to user mysql"
		exec su-exec redis "$0" "$@"
	fi
fi
exec "$@"
