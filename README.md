# balena-traefik

[traefik](https://containo.us/traefik/) stack for balenaCloud to proxy https domains to internal services

## Requirements

- RaspberryPi3, RaspberryPi4, or a similar device supported by BalenaCloud
- Custom domain name with DNS pointing to your balena device (eg. *.example.com)

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![](https://balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`ACME_EMAIL`|`foo@bar.com`|email address to use for LetsEncrypt ACME registration|
|`CERTRESOLVER`|`staging`|either set `staging` or `prod` for the LetsEncrypt certificate resolver URL|
|`BASICAUTH_USERS`|`"user1:hash","user2:hash"`|(optional) use [htpasswd](https://www.web2generators.com/apache-tools/htpasswd-generator) to generate the credentials|
|`IP_ALLOWLIST`|`"10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"`|(optional) this option sets the allowed IPs (or ranges of allowed IPs by using CIDR notation)|

## Usage

To enable a service proxy you must provide the environment variables required by the corresponding .toml file.

Refer to the comments at the top of each file for examples.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

<a href="https://www.buymeacoffee.com/klutchell" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

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
