#!/bin/bash
IP_ADDR=$(ifconfig eth0 | grep -o -e 'inet [0-9]*.[0-9]*.[0-9]*.[0-9]*' | grep -o -e [.0-9]*)
echo "My IP address is $IP_ADDR"
sed "s/server.address = 127.0.0.1/server.address = $IP_ADDR/" cascade.conf.template > cascade.conf
~/fgms/build-fgms/fgms -c cascade.conf
