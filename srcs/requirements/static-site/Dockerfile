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

ENV DOTNET_ROOT="/root/.dotnet"
ENV TOOLS="/root/.dotnet/tools"
ENV PATH="${DOTNET_ROOT}:${TOOLS}:${PATH}"

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY app/*.csproj ./
RUN dotnet restore \
	# && dotnet add package Statiq.App --version 1.0.0-beta.46 \
	&& dotnet add package Statiq.Markdown --version 1.0.0-beta.46 \
	&& dotnet add package Statiq.Web --version 1.0.0-beta.31

# Copy everything else and build
COPY app/Program.cs ./
COPY app/input ./input
RUN dotnet publish -c Release -o out

CMD [ "sh" ]