# balena-traefik

traefik stack for balenaCloud to proxy https domains to internal services

## Requirements

- RaspberryPi3, RaspberryPi4, or a similar device supported by BalenaCloud
- Custom domain name with DNS pointing to your balena device (eg. *.example.com)

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balenaCLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`ACME_EMAIL`|`foo@bar.com`|email address to use for ACME registration|
|`ACME_DOMAIN`|`example.com`|provide your custom domain here|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|

## Usage

You can change the files in `/var/traefik` and they will be retained. Do not modify the files in `/etc/traefik/` as they will be replaced on container restart.

### enable backend services

Copy the template service file from `/etc/traefik/conf.d` to `/var/traefik/conf.d` for any services you want to expose. They will be loaded dynamically by Traefik.

```bash
# eg. enable nextcloud service
cp /etc/traefik/conf.d/nextcloud.toml /var/traefik/conf.d/

# eg. disable nextcloud service
rm /var/traefik/conf.d/nextcloud.toml
```

The environment variable `ACME_DOMAIN` will be substituted in the `/etc/traefik/conf.d` templates on startup.

### enable basic auth

Add credentials for basic http auth. The first user added requires `htpasswd -c` in order to create the password file. Subsequent users should only use `htpasswd` to avoid overwriting the file.

```bash
# create two users
htpasswd -c /var/traefik/.htpasswd <user1>
htpasswd /var/traefik/.htpasswd <user2>
```

### enable duplicati

Connect to `http://<device-ip>:8200` and configure a new backup using any online service you prefer as the Destination and `/source` as Source Data.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

[Buy me a beer](https://kyles-tip-jar.myshopify.com/cart/31356319498262:1?channel=buy_button)

[Buy me a craft beer](https://kyles-tip-jar.myshopify.com/cart/31356317859862:1?channel=buy_button)

## Acknowledgments

- <https://hub.docker.com/_/traefik/>
- <https://hub.docker.com/r/linuxserver/duplicati>

## License

[MIT License](./LICENSE)
