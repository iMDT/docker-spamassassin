#!/bin/bash
while true; do
  spamd \
    --nouser-config \
    --syslog stderr \
    --username spamd \
    --helper-home-dir /var/lib/spamassassin/ \
    --pidfile /var/run/spamd.pid \
    --ip-address 0.0.0.0 \
    --allowed-ips 0.0.0.0/0 \
    --max-children 50 \
    --min-children=10 \
    --max-conn-per-child=200 ;
    echo "Spamd died, starting it again in 1s..."
    sleep 1
done
