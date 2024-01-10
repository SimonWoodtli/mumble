# Latest murmur mumble-server

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/mumble)](https://artifacthub.io/packages/search?repo=mumble)

This image contains the latest mumble-server binary and default mumble-server.ini config file.

## Features

* Latest version
* Atomic update: compiles latest mumble-server once a month and creates scratch image
* Hosted on ghcr.io

## Installation

TODO: add the config file here to, make instructions better suitable for actual server usage or copy to local machine then scp to server (even better)
TODO: currently it builds 1.6.0 that means I need to target a branch instead of master to build the latest pre-release 1.5.517

* For CI/Image install: `COPY --from=ghcr.io/simonwoodtli/mumble:latest /bin/mumble /where/You/Want`

## Local Install

1. Build image: `podman build -t alpine-mumble -f- . <<EOF
FROM alpine:latest
COPY --from=ghcr.io/simonwoodtli/mumble:latest /bin/mumble-server /bin/mumble-server
COPY --from=ghcr.io/simonwoodtli/mumble:latest /etc/mumble/mumble-server.ini /etc/mumble/mumble-server.ini
EOF`
1. Optional for SELinux (Fedora etc.): `sudo setenforce 0`
1. Copy mumble to your local machine/host: `podman run --rm -v /tmp:/mnt alpine-mumble:latest sh -c "install /bin/mumble-server /mnt"`
1. Copy mumble to your local machine/host: `podman run --rm -v /tmp:/mnt alpine-mumble:latest sh -c "install /etc/mumble/mumble-server.ini /mnt"`
1. Optional for SELinux (Fedora etc.): `sudo setenforce 1`

### On your Server: WIP, currently haven't got it to work :(

If you don't run docker on your server and ran the local install on your local dev machine just copy it to your server.

1. Copy mumble to your server: `scp /tmp/mumble-server user@SERVER_IP4:`
1. Copy mumble config to your server: `scp /tmp/mumble-server.ini user@SERVER_IP4:`
1. On your server install some dependencies: `apt install libqt5sql5 libavahi-compat-libdnssd1
libqt5dbus5 libzeroc-ice-dev libprotobuf32 libqt5network5 libqt5xml5`

### ISSUE

I thought maybe it's a dependency issue and installed `apt install
mumble-server` but even after that my binary would not run correctly. And from
what I can tell murmurd is used anyways so maybe I need that too. I already
spent a day on this for now I just use the outdated version from apt.

More notes:

* [20240109173457](/20240109173457/) Server Service: Add mumble server

Another solution: Figure out how to compile it as a standalone binary maybe that will help with :)

Related:

* <https://github.com/mumble/mumble/wiki/Installing>
