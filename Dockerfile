FROM alpine:3.17.0

LABEL maintainer="Mohammad Roshangara <mroshangara@gmail.com>"
LABEL description="A DNS proxy server based on dnsmasq"
LABEL version="1.0"

RUN apk add --no-cache dnsmasq \
    && mkdir -p /etc/dnsmasq.d/

COPY ./src/proxy.conf /etc/dnsmasq.d/
COPY ./src/dnsmasq.conf /etc/

EXPOSE 53 53/udp

ENTRYPOINT ["dnsmasq", "-d"]
