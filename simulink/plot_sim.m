close all

subplot 411
rad_to_deg = 180/pi;
plot(rpy.Time,rad_to_deg*rpy.Data,demands.Time,rad_to_deg*demands.Data(:,2:4),'--')
legend('Roll','Pitch','Yaw','Roll demand','Pitch demand','Yaw demand','Location','SouthWest')
ylabel('Orientation (deg)')

subplot 412
plot(pos.Time,pos.Data(:,3),demands.Time,demands.Data(:,1),'--')
legend('Height','Height demand','Location','NorthWest')
ylabel('Displacement (m)')

subplot 413
g = 9.81;
plot(motors.Time,motors.Data/g)
axis([0 60 0 0.35])
legend('Motor 1','Motor 2','Motor 3','Motor 4','Location','SouthWest')
ylabel('Thrust commands (g equiv.)')

subplot 414
plot(disturbances.Time,disturbances.Data)
axis([0 60 -0.12 0.22])
legend('Lateral force','Longitudinal force','Vertical force','Rolling moment','Pitching moment','Yawing moment','Location','NorthWest')
ylabel('Disturbances (N or Nm)')
xlabel('Time (s)')
