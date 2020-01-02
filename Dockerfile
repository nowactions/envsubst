FROM alpine:3.11.2

LABEL version="0.0.1"
LABEL maintainer="nownabe"
LABEL com.github.actions.name="Envsubst"
LABEL com.github.actions.description="Substitutes the values of environment variables"

RUN apk add --update --no-cache gettext=0.20.1-r2

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
