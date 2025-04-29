FROM alpine:latest

# Install necessary packages initially to prevent startup failure
RUN apk update && apk upgrade && \
    apk add --no-cache \
    tor \
    nyx \
    su-exec \
    bash

# Make sure updaes happen properly
USER root

# Entrypoint script that updates packages and then starts tor
CMD ["sh", "-c", "apk update && apk upgrade && tor -f /etc/tor/torrc"]

