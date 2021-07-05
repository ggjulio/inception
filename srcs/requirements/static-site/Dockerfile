FROM alpine:3.11
LABEL maintainer="Julio <juligonz@student.42.fr>" 

RUN apk update \
	&& apk add --no-cache bash icu-libs krb5-libs libgcc libintl \
	libssl1.1 libstdc++ zlib wget 
# wget busybox -> unrecognized option: waitretry BusyBox v1.31.1
# so install the real GNU wget

RUN wget https://dot.net/v1/dotnet-install.sh \
	&& chmod +x dotnet-install.sh \
	&& ./dotnet-install.sh -c 5.0

ENV PATH="/root/.dotnet:${PATH}"


WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ../engine/examples ./
RUN dotnet publish -c Release -o out

CMD [ "dotnet", "--version" ]