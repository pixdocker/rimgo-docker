# rimgo-quay

A [rimgo](https://codeberg.org/rimgo/rimgo) image, on Quay.
This image mostly exist for the personal instance, mostly for the shake of Notification setup and checking for commit before building docker images instead of building Docker image directly.

## Usage

- Download (or copy the content of) the `docker-compose.yml`
- (Optional) Customize the [environment variables](https://codeberg.org/rimgo/rimgo#environment-variables) how you want
- Move the docker-compose.yml file to the folder you want
- `docker-compose up -d`

## Credit

- The Invidious `container-release.yml` file: <https://github.com/iv-org/invidious/blob/master/.github/workflows/container-release.yml>
- [@unixfox](https://github.com/unixfox), invidious-custom `docker-image.yml` file: <https://github.com/unixfox/invidious-custom/blob/master/.github/workflows>
- [@pussthecat-org](https://github.com/PussTheCat-org/rimgo-quay)
