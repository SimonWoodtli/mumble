FROM docker.io/library/debian:latest AS builder
USER root

ADD build.sh /tmp/build.sh

RUN /tmp/build.sh

FROM scratch
# Copy server binary
COPY --from=builder /usr/local/bin/mumble-server /bin/mumble-server
# Copy default config
COPY --from=builder /etc/mumble/mumble-server.ini /etc/mumble/mumble-server.ini
