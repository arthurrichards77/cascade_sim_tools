# Getting Started with Ardupilot Software-in-the-Loop Simulator

## Using SITL through Mission Planner

### Multirotor Example

1. Install Mission Planner and launch it

1. Move to mission `Flight Plan` screen and use `Load WP File` button to load bridge_low.waypoints.  Click 'Yes' to reset home - you should now see a mission based at Clifton Suspension Bridge.

2. Move to `Simulation` screen and click the Multirotor icon.  You might need to approve Firewall access at this point.  It should bounce you over to the Flight Data screen.  Check that the 'connected' plugs at top right are green and use the Status tab at the bottom left to see numbers changing.  You should see a little quadrotor icon over middle of the bridge.

1. Pop back to Flight Plan and click 'Write WPs'.  Then go back to Flight Data and should see the mission appearing near the little quadrotor.

1. Move to actions tab at bottom left.  In *quick* succession: click arm, right click map, choose take-off, and enter 25 as altitude.  The artificial horizon at top left should wobble and the altitude tape should show a climb to altitude.

1. In actions tab, click `Auto`.  Should see drone follow mission.  Check the speed stays below 3m/s in the indicator screen.

### Fixed-wing Example

1. Start Mission Planner
2. Load waypoints file `llanbedr_plane.waypoints`
3. On the simulation screen, click the Plane icon.
> It'd be useful to set the heading along the runway, but for reasons unknown, it only allows you to set it between 0 and 100.
1. On `Flight Plan` screen click `Write WPs`
1. Back on `Flight Data` screen, select the `Actions` tab in the bottom left pane.
1. In *quick* succession, click `Arm` and set mode to `TAKEOFF`.  Plane should launch and then circle at 25m altitude.
1. Set mode to `Auto` and it should follow the waypoints.

### Companion computers

To reproduce an on-board companion, use TCP port 5762 or 5763 to talk straight to the (simulated) drone.

Ground: in Mission Planner, press Ctrl+F, click Mavlink, choose 'TCP Host - 14550' and enable 'Write access'.  Click start.  Change port if you like.  Then use this port to talk to the drone through Mission Planner.
