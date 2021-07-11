FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
	&& apk add --no-cache perl perl-dev curl wget make tar openssl openssl-dev zlib zlib-dev gcc build-base \
		perl-io-socket-inet6 \
		perl-io-socket-ssl \
		perl-json \
	&& curl -L https://cpanmin.us/ -o /usr/local/bin/cpanm \
	&& chmod +x /usr/local/bin/cpanm \
	&& mkdir ddclient \
	&& wget -q -O - https://github.com/ddclient/ddclient/archive/refs/tags/v3.9.1.tar.gz | tar -xz -C /ddclient --strip-components=1 \
	&& cpanm \
		Data::Validate::IP	\
		IO::Socket::SSL		\
		JSON::PP			\
		IO::Socket::INET6	\
	&& echo ok
