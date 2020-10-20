FROM edrdo/ardupilot-sitl-docker
WORKDIR /ardupilot
RUN make clean
RUN git pull
RUN ./waf configure
RUN ./waf copter
