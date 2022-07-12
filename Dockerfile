FROM alpine:3.16

RUN addgroup -g 2000 rspamd && adduser -u 2000 -G rspamd -h /var/lib/rspamd -D -s /sbin/nologin rspamd

RUN apk add --no-cache rspamd rspamd-controller rspamd-proxy rspamd-fuzzy ca-certificates curl

RUN mkdir /run/rspamd

RUN echo 'type = "console";' > /etc/rspamd/override.d/logging.inc \
    && echo 'bind_socket = "*:11334";' > /etc/rspamd/override.d/worker-controller.inc \
    && echo 'pidfile = false;' > /etc/rspamd/override.d/options.inc

COPY start.sh /

EXPOSE 11332/tcp 11334/tcp 11335/tcp

VOLUME ["/var/lib/rspamd"]

CMD ["/start.sh"]
