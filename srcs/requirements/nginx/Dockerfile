FROM alpine:3.13
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
 && apk add --no-cache nginx openssl \
 && openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
 && apk del openssl \
 && mkdir -p /run/nginx \
 && mkdir -p /var/www/app \
 && mkdir -p /var/www/adminer \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx-block.conf /etc/nginx/http.d/default.conf
COPY index.html /var/www/app

VOLUME /var/www/app/

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
