#!/bin/sh
set -e

mkdir -p /etc/traefik/conf.d

# substitute environment variables
envsubst < /var/traefik/traefik.toml > /etc/traefik/traefik.toml
envsubst < /var/traefik/conf.d/auth.toml > /etc/traefik/conf.d/auth.toml
envsubst < /var/traefik/conf.d/ssl.toml > /etc/traefik/conf.d/ssl.toml

for toml in /var/traefik/conf.d/*.toml
do
    # skip files where no host rule is provided
    envsubst < "${toml}" | grep -q 'Host(``)' && continue
    # substitute environment variables in service files
    envsubst < "${toml}" > /etc/traefik/conf.d/"$(basename "${toml}")"
done

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]
then
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