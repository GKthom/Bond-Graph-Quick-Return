%this M file is used to obtain the force plots
plot(t,FA33_0(1,:),t,FA33_0(2,:),t,FA33_0(3,:));%axis([0 5 -200 200])
title('components of force ^{0}F_{A33} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FA33_0(1,:),atan2(x(:,2),x(:,5)),FA33_0(2,:),atan2(x(:,2),x(:,5)),FA33_0(3,:));%axis([0 5 -200 200])
title('components of force ^{0}F_{A33} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FO4_0(1,:),t,FO4_0(2,:),t,FO4_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O4} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FO4_0(1,:),atan2(x(:,2),x(:,5)),FO4_0(2,:),atan2(x(:,2),x(:,5)),FO4_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O4} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FA4_0(1,:),t,FA4_0(2,:),t,FA4_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A4} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FA4_0(1,:),atan2(x(:,2),x(:,5)),FA4_0(2,:),atan2(x(:,2),x(:,5)),FA4_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{A4} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,FO5_0(1,:),t,FO5_0(2,:),t,FO5_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O5} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),FO5_0(1,:),atan2(x(:,2),x(:,5)),FO5_0(2,:),atan2(x(:,2),x(:,5)),FO5_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{O5} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(t,F5C_0(1,:),t,F5C_0(2,:),t,F5C_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{5C} vs time t');
xlabel('time t(s)');
ylabel('force (N)');
legend('x component', 'y component', 'z component');
pause;

plot(atan2(x(:,2),x(:,5)),F5C_0(1,:),atan2(x(:,2),x(:,5)),F5C_0(2,:),atan2(x(:,2),x(:,5)),F5C_0(3,:));%axis([0 5 -50 50])
title('components of force ^{0}F_{5C} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('force (N)');
legend('x component', 'y component', 'z component');

