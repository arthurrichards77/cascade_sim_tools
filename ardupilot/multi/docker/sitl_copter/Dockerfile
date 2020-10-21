FROM arthur/ardupilot
WORKDIR /ardupilot
ENV SYSID=1
COPY ./starts.txt .
RUN echo '#!/bin/bash' > launch.sh
RUN echo 'ip a' >> launch.sh
RUN echo 'SYSID=$(ip a | grep -o -m 1 172.[0123456789]*.0.[0123456789]* | grep -o [0123456789]*$)' >> launch.sh
RUN echo 'STARTPOSE=$(tail -n +$SYSID starts.txt | head -n 1)' >> launch.sh
RUN echo '/ardupilot/build/sitl/bin/arducopter --model=quad --defaults=/ardupilot/Tools/autotest/default_params/copter.parm --sysid=$SYSID --home=$STARTPOSE &' >> launch.sh
RUN echo 'mavproxy.py --non-interactive --target-system=$SYSID --master=tcp:0.0.0.0:5760 --out=udp:172.18.0.1:14553' >> launch.sh
RUN chmod +x launch.sh
CMD /ardupilot/launch.sh
