FROM node:24.1-alpine3.21

LABEL Description="The Balena CLI"

RUN apk add --no-cache openssh-client

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        make \
        git \
        linux-headers \
        python3 \
        libudev-zero-dev && \
    npm install balena-cli@21.1.0 -g --omit=dev --unsafe-perm && \
    apk del --no-cache .build-deps && \
    rm -rf ~/.npm ~/.cache
