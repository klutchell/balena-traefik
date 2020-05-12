FROM traefik:v2.2

COPY traefik.toml /etc/traefik/traefik.toml
COPY conf.d /etc/traefik/conf.d
COPY entrypoint.sh /entrypoint.sh
