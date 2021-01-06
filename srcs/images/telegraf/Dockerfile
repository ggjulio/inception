FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

ENV PATH="${PATH}:/telegraf/usr/bin"

RUN mkdir -p /telegraf \
	&& wget -q -O - https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
		| tar -xz -C telegraf --strip-components=1 

COPY telegraf.conf 

EXPOSE 8086

CMD [""]
