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

### configure backend services

You will need a `conf.d./<service>.toml` file for each backend service you want to expose.

There are currently 3 example services:

- `nextcloud.toml`
- `zoneminder.toml`
- `homeassistant.toml`

None of these are required, they are just provided as examples to expose your self-hosted services.

The environment variable `ACME_DOMAIN` can be used in these files and will be substituted on startup.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

[Buy me a beer](https://kyles-tip-jar.myshopify.com/cart/31356319498262:1?channel=buy_button)

[Buy me a craft beer](https://kyles-tip-jar.myshopify.com/cart/31356317859862:1?channel=buy_button)

## Acknowledgments

- <https://hub.docker.com/_/traefik/>

## License

[MIT License](./LICENSE)
