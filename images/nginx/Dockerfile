FROM alpine:3.11

RUN apk update \
 && apk add --no-cache nginx openssl \
 && openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
 && mkdir -p /run/nginx \
 && mkdir -p /var/www/app

COPY nginx-block.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/app
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]