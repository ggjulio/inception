FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

ENV PATH="${PATH}:/telegraf/usr/bin"

RUN apk add --no-cache libc6-compat iputils net-snmp-tools procps lm_sensors tzdata \
	&& mkdir -p /telegraf \
	&& wget -q -O - https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
		| tar -xz -C telegraf --strip-components=2 \
	&& mv /telegraf/etc/telegraf/ /etc/telegraf/ \
	&& mv /telegraf/usr/bin/telegraf /usr/bin/ \
	&& rm -rf /telegraf

EXPOSE 8125/udp 8092/udp 8094

CMD ["telegraf"]
