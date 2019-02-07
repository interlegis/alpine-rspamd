FROM rawmind/alpine-monit:5.25-3

RUN apk add --no-cache rspamd rspamd-controller rspamd-proxy rspamd-fuzzy ca-certificates curl

RUN mkdir /run/rspamd

COPY monit-service.conf /opt/monit/etc/conf.d
COPY start.sh /

EXPOSE 11332/tcp 11334/tcp 11335/tcp

VOLUME ["/var/lib/rspamd"]
