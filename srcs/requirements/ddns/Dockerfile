FROM alpine:3.14
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
	&& apk add --no-cache --virtual=build-deps \
		wget make tar gcc build-base \
	&& apk add --no-cache \
		perl perl-dev curl openssl openssl-dev zlib zlib-dev \
		perl-io-socket-inet6 \
		perl-io-socket-ssl \
	&& curl -L https://cpanmin.us/ -o /usr/local/bin/cpanm \
	&& chmod +x /usr/local/bin/cpanm \
	&& echo "Downloading ddclient..." \
	&& mkdir ddclient \
	&& wget -q -O - https://github.com/ddclient/ddclient/archive/refs/tags/v3.9.1.tar.gz | tar -xz -C /ddclient --strip-components=1 \
	&& cpanm \
		Data::Validate::IP	\
		IO::Socket::SSL		\
		JSON::PP			\
		IO::Socket::INET6	\
	&& echo "Removing Build dependencies..." \
	&& apk del --purge build-deps \
	&& echo "Installing and configuring ddclient..." \
	&& cp ddclient/ddclient /usr/sbin/ \
	&& mkdir /etc/ddclient /var/cache/ddclient \
	&& echo -e "# Custom Config\n\
ssl=yes                                 									\n\
use=web, web=checkip.dyndns.com/, web-skip='Current IP Address: '			\n\
syslog=yes                              # log update msgs to syslog			\n\
mail-failure=root                       # mail failed update msgs to root	\n\
" > /etc/ddclient/ddclient.conf

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]


CMD [ "ddclient", "-foreground" ]
