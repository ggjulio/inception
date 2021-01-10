FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

ENV PATH="${PATH}:grafana/bin"

RUN mkdir -p /grafana \
	&& apk add --no-cache libc6-compat \
	&& wget -q -O - https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz \
			| tar -xz -C grafana --strip-components=1

# COPY data/ /grafana_data_backup
COPY data/ /grafana/data

EXPOSE 3000

CMD ["grafana-server", "-homepath=/grafana"]
