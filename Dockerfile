FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add --no-cache \
    tor \
    nyx \
    su-exec \
    bash

CMD ["sh", "-c", "tor -f /etc/tor/torrc"]
