#!/bin/sh

exec /usr/sbin/rrdcached \
	-g \
	${RRDCACHED_ALWAYS_FLUSH_ON_SHUTDOWN:+-F} \
	-B \
	-R \
	-l :42217 \
	-b /data/db \
	-j /data/journal \
	-w ${RRDCACHED_WRITE_TIMEOUT:-300} \
	-z ${RRDCACHED_WRITE_JITTER:-0} \
	-f ${RRDCACHED_FLUSH_DEAD_DATA_INTERVAL:-3600} \
	-t ${RRDCACHED_THREADS:-4}
