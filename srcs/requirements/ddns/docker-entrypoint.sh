#!/bin/sh

set -e

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
}

has_error=
if [ -z "$PROTOCOL" ]; then
	log_error '$PROTOCOL variable not defined'
	has_error=1
fi
if [ -z "$SERVER" ]; then
	log_error '$SERVER variable not defined'
	has_error=1
fi
if [ -z "$DAEMON" ]; then
	log_error '$DAEMON variable not defined'
	has_error=1
fi
if [ -z "$LOGIN" ]; then
	log_error '$LOGIN variable not defined'
	has_error=1
fi
if [ -z "$PASSWORD" ]; then
	log_error '$PASSWORD variable not defined'
	has_error=1
fi
if [ -z "$DOMAIN_NAME" ]; then
	log_error '$DOMAIN_NAME variable not defined'
	has_error=1
fi

if [ $has_error ]; then
	exit 1
fi

echo -e "\n# From entrypoint				\n\
protocol=$PROTOCOL							\n\
server=$SERVER								\n\
daemon=$DAEMON	    # check every n seconds	\n\
login=$LOGIN								\n\
password=$PASSWORD							\n\
$DOMAIN_NAME								\n\
" >> /etc/ddclient/ddclient.conf

unset LOGIN PASSWORD DOMAIN_NAME DAEMON SERVER PROTOCOL

exec "$@"
