# Multi-vehicle Simulations using Ardupilot SITL

Here is an attempt at producing a _scalable_ simulation of multiple UAVs using Ardupilot's [software-in-the-loop (SITL)](https://ardupilot.org/dev/docs/sitl-simulator-software-in-the-loop.html) capability.

The key enabler is the combination of all the [MAVLINK](https://mavlink.io/en/) streams into a single network stream, meaning that additional simulated agents can be 
spun up without additional supervisory connections.  Hence each SITL instance is accompanied by a dedicated [mavproxy.py](https://ardupilot.org/mavproxy/) instance which [forwards
its MAVLINK data](https://ardupilot.org/mavproxy/docs/getting_started/forwarding.html#mavproxy-forwarding) to a common UDP port.  Then a single ground control station (or perhaps some other supervisory agent) can connect to this stream.
To ensure the stream can be demultiplexed, it is important that each SITL instance has a unique MAVLINK [system ID](https://mavlink.io/en/guide/routing.html), set by the [SYSID_THISMAV](https://ardupilot.org/copter/docs/parameters.html#sysid-thismav-mavlink-system-id-of-this-vehicle) parameter.
Since Copter 4.04, this has been supported by a command line option in SITL, saving awkward work arounds: the autopilot demands a reboot before the parameter takes effect.

## Native Multi-UAV Simulation

The `launch_copter.sh` script can be used to launch multiple SITLs on one Ubuntu host PC with the appropriate settings.  Use `launch_copter.sh N` to launch
instance N.  To avoid port and file conflicts, each agent has unique ports and a local temp directory.  Connect a ground station (experiments have used QGroundControl)
to UDP port 14553 to view and control your drones.

## Using Docker

Experimental support has been developed for doing this in [Docker](https://www.docker.com/), which offers natural scalability via its container framework.  Credit to Eduardo R. B. Marques whose [Ardupilot Docker image](https://hub.docker.com/r/edrdo/ardupilot-sitl-docker) has been the starting point for mine.  To get started:
1. [Install docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/).
2. Navigate to the `update` subfolder and run `docker build -t arthur/ardupilot .`.  This produces a Docker image with the latest Ardupilot source, supporting the 
crucial `--sysid` command line option.
3. Navigate to the `sitl_copter` subfolder and run `docker-compose build` followed by `docker-compose up`.  This should start up three 
simulation instances, plus each associated mavproxy.py, in three containers.  Run `docker ps` to see your three sims in action.
4. Connect your ground station to UDP 14553 to control and view the fleet.

### Notes on Docker

* To get the UDP datagrams from mavproxy.py inside the container to the outside world, they have to be sent to 172.17.0.1, which is the
gateway between the Docker internal network and the host.  Following learning from this post: (https://forums.docker.com/t/udp-port-mapping-sending-data-from-container-to-host/35762/5)

### Future Plans

At the moment, each new simulation instance needs a unique environment variable in `docker-compose.yml` to define its system ID.  This means
that useful stuff like the `--scale` options won't work.  One idea is to include an identity server in the docker-compose such that each new simulator
instance goes and gets the next number in line from the server.  Since all the examples for Docker revolve around a hit counter on a web page,
it might even be possible to use something extant.  That's essentially what's needed.  Then every SITL container would have an identical
environment.

It's of limited use to get dozens of drones on one GCS screen.  This will get more fun when each drone also has its own controller container.  Docker
internal networking should help with this.

Eventually, it'd be nice to get this on a Docker swarm in the cloud, e.g. on AWS, so you could run massive simulations with very simple scaling.

