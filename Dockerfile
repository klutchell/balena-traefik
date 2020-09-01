FROM traefik:v2.2.8

COPY traefik.toml /var/traefik/traefik.toml
COPY conf.d /var/traefik/conf.d
COPY entrypoint.sh /entrypoint.sh

WORKDIR /etc/traefik

VOLUME /var/certs

EXPOSE 80/tcp 443/tcp 8080/tcp

RUN apk add --no-cache gettext \
    && chmod +x /entrypoint.sh
