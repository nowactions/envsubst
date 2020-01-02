FROM alpine:3.11.2

RUN apk add --update --no-cache gettext=0.20.1-r2

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
