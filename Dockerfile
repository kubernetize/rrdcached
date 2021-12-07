FROM alpine:3.15

RUN \
    adduser -D -H -u 1000 rrdcached && \
    apk --no-cache add rrdtool-cached

ADD assets/ /

USER 1000

CMD ["/usr/local/bin/rrdcached.sh"]
