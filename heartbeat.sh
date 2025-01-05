#!/bin/bash
#
# (Heart)beat script.
#

# The name of the heartbeat file.
HEARTBEAT_FILE="heartbeat.txt"

# The threshold for the random sleep in seconds.
MIN_SLEEP=21600
MAX_SLEEP=86400

set -e

cd $(dirname $0)

while :
do
    echo "Adding heartbeat…"
    date '+%s' >${HEARTBEAT_FILE}
    git add ${HEARTBEAT_FILE}
    git commit -q -m "Heartbeat $(date '+%Y-%m-%d %H:%M:%S')"
    git push

    SECONDS=$((${MIN_SLEEP} + ${RANDOM} % ${MAX_SLEEP}))
    echo "Sleeping for ${SECONDS} seconds…"
    sleep ${SECONDS}
done

