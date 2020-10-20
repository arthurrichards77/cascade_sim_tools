#!/bin/bash' > launch.sh
/ardupilot/build/sitl/bin/arducopter --model=quad --defaults=/ardupilot/Tools/autotest/default_params/copter.parm --sysid=$SYSID &'
mavproxy.py --non-interactive --target-system=$SYSID --master=tcp:0.0.0.0:5760 --out=udp:172.17.0.1:14553'
