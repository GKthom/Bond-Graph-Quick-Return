%this M file is used to obtain the force plots
plot(t,FO1_0(1,:),t,FO1_0(2,:),t,FO1_0(3,:));%axis([0 5 -200 200])
title('components of force ^{0}F_{O1} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FO1_0(1,:),atan2(x(:,2),x(:,5)),FO1_0(2,:),atan2(x(:,2),x(:,5)),FO1_0(3,:));%axis([0 5 -200 200])
title('components of force ^{0}F_{O1} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FA1_0(1,:),t,FA1_0(2,:),t,FA1_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A1} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FA1_0(1,:),atan2(x(:,2),x(:,5)),FA1_0(2,:),atan2(x(:,2),x(:,5)),FA1_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A1} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FA2_0(1,:),t,FA2_0(2,:),t,FA2_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A2} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FA2_0(1,:),atan2(x(:,2),x(:,5)),FA2_0(2,:),atan2(x(:,2),x(:,5)),FA2_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A2} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FA3_0(1,:),t,FA3_0(2,:),t,FA3_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A3} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FA3_0(1,:),atan2(x(:,2),x(:,5)),FA3_0(2,:),atan2(x(:,2),x(:,5)),FA3_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A3} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FO3_0(1,:),t,FO3_0(2,:),t,FO3_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O3} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FO3_0(1,:),atan2(x(:,2),x(:,5)),FO3_0(2,:),atan2(x(:,2),x(:,5)),FO3_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O3} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');

