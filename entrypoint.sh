#!/bin/sh
set -e

# substitute some env vars in traefik.toml and conf.d
sed "s|ACME_EMAIL|${ACME_EMAIL}|g" -i /etc/traefik/traefik.toml
sed "s|ACME_DOMAIN|${ACME_DOMAIN}|g" -i /etc/traefik/conf.d/*.toml

# always enable auth and ssl middlewares for services that need it
cp -v /etc/traefik/conf.d/auth.toml /var/traefik/conf.d/
cp -v /etc/traefik/conf.d/ssl.toml /var/traefik/conf.d/

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

# if our command is a valid Traefik subcommand, let's invoke it through Traefik instead
# (this allows for "docker run traefik version", etc)
if traefik "$1" --help >/dev/null 2>&1
then
    set -- traefik "$@"
else
    echo "= '$1' is not a Traefik command: assuming shell execution." 1>&2
fi

exec "$@"