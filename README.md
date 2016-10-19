# dind-options Docker Image

A slightly modified version of the official [Docker-in-Docker](https://hub.docker.com/_/docker/)
image (specifically the `docker:dind` image), allowing arguments to its
entrypoint to be passed as an environment variable.

My main issue was that when using the official image as a Gitlab CI service, I
am unable to pass any CLI options. Because I use a Docker registry with a
self-signed certificate, I need to pass `--insecure-registry` to dind during
startup.

As such, I added a small wrapper entrypoint that adds the contents of the
`DOCKER_OPTS` environment variable to the CLI arguments of the normal entrypoint.

This allows me to do this in Gitlab CI:

```yaml
image: docker:latest

variables:
    DOCKER_OPTS: "--insecure-registry=my.docker.registry"
    DOCKER_HOST: "tcp://lordgaav__dind-options:2375"

services:
    - lordgaav/dind-options:latest
```

## License

Released under the MIT license.
