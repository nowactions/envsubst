FROM alpine:3.12.2

LABEL version="1.0.1"
LABEL maintainer="nownabe"
LABEL com.github.actions.name="Simple Envsubst"
LABEL com.github.actions.description="Substitutes the values of environment variables"
LABEL com.github.actions.icon="file-text"
LABEL com.github.actions.color="red"

RUN apk add --update --no-cache gettext=0.20.1-r2

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
