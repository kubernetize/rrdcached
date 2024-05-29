FROM alpine:3.20.0

LABEL org.opencontainers.image.authors "Richard Kojedzinszky <richard@kojedz.in>"
LABEL org.opencontainers.image.source https://github.com/kubernetize/rrdcached

RUN \
    adduser -D -H -u 1000 rrdcached && \
    apk --no-cache add rrdtool-cached

ADD assets/ /

USER 1000

CMD ["/usr/local/bin/rrdcached.sh"]
