FROM arthur/ardupilot
WORKDIR /ardupilot
ENV SYSID=1
RUN echo '#!/bin/bash' > launch.sh
RUN echo '/ardupilot/build/sitl/bin/arducopter --model=quad --defaults=/ardupilot/Tools/autotest/default_params/copter.parm --sysid=$SYSID &' >> launch.sh
RUN echo 'mavproxy.py --non-interactive --target-system=$SYSID --master=tcp:0.0.0.0:5760 --out=udp:172.17.0.1:14553' >> launch.sh
RUN chmod +x launch.sh
CMD /ardupilot/launch.sh
