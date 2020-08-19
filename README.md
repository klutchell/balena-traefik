# balena-traefik

[traefik](https://containo.us/traefik/) stack for balenaCloud to proxy https domains to internal services

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
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`ACME_EMAIL`|`foo@bar.com`|email address to use for ACME registration|
|`CERTRESOLVER`|`staging`|default letsencrypt certificate resolver to use (`staging` or `prod`) - can be overriden per service file if required|
|`BASICAUTH_USERS`|`"user1:hash","user2:hash"`|use [htpasswd](https://www.web2generators.com/apache-tools/htpasswd-generator) to generate the credentials|
|`NEXTCLOUD_HOST`|`nextcloud.example.com`|in order to proxy to an internal nextcloud server, provide the public facing domain|
|`NEXTCLOUD_SERVER`|`http://192.168.1.5:80`|in order to proxy to an internal nextcloud server, provide the internal server url|
|`PLEX_HOST`|`plex.example.com`|in order to proxy to an internal plex server, provide the public facing domain|
|`PLEX_SERVER`|`http://192.168.8.64:32400`|in order to proxy to an internal plex server, provide the internal server url|

Note that `envsubst` is being used to install all traefik conf files so new environment variables can be added and replaced as needed.

Look at the corresponding conf.d files to see which other environment variables are required.

## Usage

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

[Buy me a beer](https://kyles-tip-jar.myshopify.com/cart/31356319498262:1?channel=buy_button)

[Buy me a craft beer](https://kyles-tip-jar.myshopify.com/cart/31356317859862:1?channel=buy_button)

## References

- <https://docs.traefik.io/v2.2/https/tls/>
- <https://docs.traefik.io/v2.2/https/acme/>
- <https://docs.traefik.io/v2.2/middlewares/basicauth/>
- <https://docs.traefik.io/v2.2/middlewares/headers/>
- <https://ssl-config.mozilla.org/>
- <https://docs.linuxserver.io/images/docker-letsencrypt>
- <https://github.com/linuxserver/reverse-proxy-confs>

## License

[MIT License](./LICENSE)
