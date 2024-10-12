FROM node:22.9-alpine3.20

LABEL Description="The Balena CLI"

RUN apk add --no-cache openssh-client

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        make \
        git \
        linux-headers \
        python3 \
        libudev-zero-dev && \
    npm install balena-cli@19.1.0 -g --omit=dev --unsafe-perm && \
    apk del --no-cache .build-deps && \
    rm -rf ~/.npm ~/.cache
