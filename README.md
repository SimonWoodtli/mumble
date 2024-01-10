# Latest mumble-server

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/mumble)](https://artifacthub.io/packages/search?repo=mumble)

This image contains the latest mumble-server binary and default mumble-server.ini config file.

## Features

* Latest version
* Atomic update: compiles latest mumble-server once a month and creates scratch image
* Hosted on ghcr.io

## Installation

TODO: add the config file here to, make instructions better suitable for actual server usage or copy to local machine then scp to server (even better)

* For CI/Image install: `COPY --from=ghcr.io/simonwoodtli/mumble:latest /bin/mumble /where/You/Want`
* For local install:
1. Build image: `docker build -t alpine-mumble -f- . <<EOF
FROM alpine:latest
COPY --from=ghcr.io/simonwoodtli/mumble:latest /bin/mumble /bin/mumble
EOF`
2. Copy mumble to host: `docker run --rm -v $HOME/.local/bin:/mnt alpine-mumble sh -c "install
/bin/mumble /mnt"`

Related:

* <https://github.com/mumble/mumble/wiki/Installing>
