#!/bin/bash
PATH="$PATH:/usr/bin/vendor_perl/"
set -m
./update.sh &
./spamd.sh &

trap '
  JOBS=$(jobs -p)
  while true ; do
    for JOB in $JOBS; do
      echo "Killing $JOB"
      kill -9 -$JOB &> /dev/null
    done;

    JOBS=$(jobs -p)
    if [ -z "$JOBS" ] ; then
        echo "All killed";
	exit 0;
        break;
    else
        echo "Still alive: [$JOBS]"
    fi;
    sleep 0.1
  done;
' EXIT
wait
