#!/bin/sh

exec /usr/sbin/rrdcached \
	-g \
	-B \
	-R \
	-l :42217 \
	-b /data/db \
	-j /data/journal \
	-p ${RRDCACHED_PID:-/tmp/rrdcached.pid} \
	${RRDCACHED_ALWAYS_FLUSH_ON_SHUTDOWN:+-F} \
	${RRDCACHED_FLUSH_DEAD_DATA_INTERVAL:+-f ${RRDCACHED_FLUSH_DEAD_DATA_INTERVAL}} \
	${RRDCACHED_THREADS:+-t ${RRDCACHED_THREADS}} \
	${RRDCACHED_WRITE_TIMEOUT:+-w ${RRDCACHED_WRITE_TIMEOUT}} \
	${RRDCACHED_WRITE_JITTER:+-z ${RRDCACHED_WRITE_JITTER}}
