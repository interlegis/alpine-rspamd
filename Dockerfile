FROM alpine:3.16

RUN apk add --no-cache rspamd rspamd-controller rspamd-proxy rspamd-fuzzy ca-certificates curl

RUN mkdir /run/rspamd

COPY start.sh /

EXPOSE 11332/tcp 11334/tcp 11335/tcp

VOLUME ["/var/lib/rspamd"]

CMD ["/start.sh"]
