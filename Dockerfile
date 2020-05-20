FROM traefik:v2.2

RUN apk add --no-cache apache2-utils

WORKDIR /var/traefik/conf.d

COPY traefik.toml /etc/traefik/traefik.toml
COPY conf.d /etc/traefik/conf.d
COPY conf.d/ssl.toml conf.d/auth.toml /var/traefik/conf.d/
COPY entrypoint.sh /entrypoint.sh
