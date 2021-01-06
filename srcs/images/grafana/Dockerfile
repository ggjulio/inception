FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN mkdir -p /grafana \
	&& apk add --no-cache libc6-compat \
	&& wget -q -O - https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz \
			| tar -xvz -C grafana --strip-components=1

ENV PATH="${PATH}:grafana/bin"

EXPOSE 3000

CMD ["grafana-server", "-homepath=/grafana"]
