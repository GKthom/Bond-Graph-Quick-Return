plot(t,Tc(1,:),t,Tc(2,:),t,Tc(3,:));
title('components of torque T_{C} vs time t');
xlabel('time t(s)');
ylabel('torque (Nm)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),Tc(1,:),atan2(x(:,2),x(:,5)),Tc(2,:),atan2(x(:,2),x(:,5)),Tc(3,:)); axis([0 3.5 -20 550]);
title('components of torque T_{C} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('torque (Nm)');
legend('x component', 'y component', 'z component');
pause;