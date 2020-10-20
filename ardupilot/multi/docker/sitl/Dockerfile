FROM arthur/sitl:v1
WORKDIR /ardupilot
ENV SYSID=1
RUN echo '#!/bin/bash' > launch.sh
RUN echo '/ardupilot/build/sitl/bin/arducopter --model=quad --sysid=$SYSID &' >> launch.sh
RUN echo 'mavproxy.py --target-system=$SYSID --master=tcp:0.0.0.0:5760 --out=udp:172.17.0.1:14553' >> launch.sh
RUN chmod +x launch.sh
CMD /ardupilot/launch.sh
