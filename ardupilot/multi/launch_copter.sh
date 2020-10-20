#!/bin/bash
# assumes SIM_VEHICLE.PY on path

VEHICLE=ArduCopter

if [ -z $1 ]; then
  echo "USAGE: $0 NUM"
  echo "  Launch SITL $VEHICLE with SYSID_THISMAV=NUM"
  exit 1
fi

echo "Launching $VEHICLE as system $1"

mkdir -p ardu_tmp/sys$1
cd ardu_tmp/sys$1

sim_vehicle.py --no-rebuild --wipe-eeprom --vehicle=$VEHICLE --instance=$1 --sysid=$1 --out=udp:127.0.0.1:14553 --mavproxy-args='--non-interactive'
