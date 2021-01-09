FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

# NEED environment variable $USER and $PASSWORD in order to create a user.

RUN apk add --no-cache vsftpd openssl \
	&& mkdir -p /etc/ssl/private \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
		-subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" \ 
		-keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
	&& apk del openssl 
	# && ln -sf /dev/stdout /var/log/vsftpd.log 

EXPOSE 21 20 20000-20002

COPY vsftpd.conf /etc/vsftpd.conf
COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["vsftpd"] 
