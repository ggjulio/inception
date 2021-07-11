#!/bin/sh

set -e

BOLD="\e[1m"
RESET="\e[0m"
LIGHT_GREEN="\e[92m"
LIGHT_CYAN="\e[96m"

logging(){
	local type=$1; shift
	printf "${LIGHT_CYAN}${BOLD}Entrypoint${RESET} [%b] : %b\n" "$type" "$*"
}

log_info(){
	logging "${LIGHT_GREEN}info${RESET}" "$@"
}

if [ "$1" = "redis-server" ]; then

	if [ "$(id -u)" = "0" ]; then
		log_info "Switch from root to user redis"
		exec su-exec redis "$0" "$@"
	fi
fi

exec "$@"
