FROM node:16.13-alpine3.11

LABEL Description="The Balena CLI"

RUN apk add --no-cache openssh-client

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        make \
        git \
        linux-headers \
        python3 && \
    npm install balena-cli -g --production --unsafe-perm && \
    apk del --no-cache .build-deps && \
    rm -rf ~/.npm ~/.cache
