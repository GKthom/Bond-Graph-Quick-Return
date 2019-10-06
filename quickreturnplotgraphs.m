%plots graphs for the simulation results produced by file
%quickreturn.m

plot3(x(:,1), x(:,2), x(:,3)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{1}R column 1');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,4), x(:,5), x(:,6)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{1}R  column 2');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,7), x(:,8), x(:,9)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{1}R  column 3');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,1), x(:,2), x(:,3), x(:,4), x(:,5), x(:,6), x(:,7), x(:,8), x(:,9)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{1}R all columns');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot(t, x(:,19), t, x(:,20), t, x(:,21)); grid on;axis equal;
 title('{Coordinates of center of mass C_{1}  ^{0}_{0}r_{c1}  vs time t}');
xlabel('time t(s)');
ylabel('Coordinates (m)');
legend('X coordinate', 'Y coordinate', 'Z coordinate');
pause;

plot3(x(:,19), x(:,20), x(:,21)); grid on;  axis ([-.2 .2 -.2 .2 -.2 .2]);
title('Position of C.M. C_{1}  ^{0}_{0}r_{c1}');
xlabel('X coordinate (m)');
ylabel('Y coordinate (m)');
zlabel('Z coordinate (m)');
pause;

plot(t, x(:,13),t, x(:,14), t, x(:,15)); grid on;
title('Translational momentum ^{0}_{0}p_{1} vs time t');
xlabel('time t(s)');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;

plot(atan2(x(:,2),x(:,5)), x(:,13),atan2(x(:,2),x(:,5)), x(:,14), atan2(x(:,2),x(:,5)), x(:,15)); grid on;
title('Translational momentum ^{0}_{0}p_{1} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;


plot(t, x(:,16), t, x(:,17), t, x(:,18)); grid on;
title('Angular momentum ^{0}_{C1}p_{1} vs time t ');
xlabel('time t(s)');
ylabel('angular momentum components (N-m-s)');
legend('x ang mom', 'y ang mom', 'z ang mom');
pause;


plot3(x(:,22), x(:,23), x(:,24)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{2}R column 1');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,25), x(:,26), x(:,27)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{2}R  column 2');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,28), x(:,29), x(:,30)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{2}R  column 3');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,22), x(:,23), x(:,24), x(:,25), x(:,26), x(:,27), x(:,28), x(:,29), x(:,30)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{2}R all columns');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot(t, x(:,40), t, x(:,41), t, x(:,42)); grid on;
title('Coordinates of center of mass C_{2}  ^{0}_{0}r_{c2}  vs time t');
xlabel('time t(s)');
ylabel('Coordinates (m)');
legend('X coordinate', 'Y coordinate', 'Z coordinate');
pause;

plot3(x(:,40), x(:,41), x(:,42)); grid on; axis ([-.2 .2 -.2 .2 -.2 .2]);
title('Position of C.M. C_{2}  ^{0}_{0}r_{c2}');
xlabel('X coordinate (m)');
ylabel('Y coordinate (m)');
zlabel('Z coordinate (m)');
pause;

plot(t, x(:,34),t, x(:,35), t, x(:,36)); grid on;
title('Translational momentum ^{0}_{0}p_{2} vs time t');
xlabel('time t(s)');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;

plot(atan2(x(:,2),x(:,5)), x(:,34),atan2(x(:,2),x(:,5)), x(:,35), atan2(x(:,2),x(:,5)), x(:,36)); grid on;
title('Translational momentum ^{0}_{0}p_{2} vs crank angle \theta _{1}');
xlabel('crank angle \theta _{1} in radians');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;

plot(t, x(:,37), t, x(:,38), t, x(:,39)); grid on;
title('Angular momentum ^{0}_{C2}p_{2} vs time t');
xlabel('time t(s)');
ylabel('angular momentum components (N-m-s)');
legend('x ang mom', 'y ang mom', 'z ang mom');
pause;



plot3(x(:,43), x(:,44), x(:,45)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R column 1');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,46), x(:,47), x(:,48)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R  column 2');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,49), x(:,50), x(:,51)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R  column 3');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,43), x(:,44), x(:,45), x(:,46), x(:,47), x(:,48), x(:,49), x(:,50), x(:,51)); grid on; axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R all columns');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot(t, x(:,61), t, x(:,62), t, x(:,63)); grid on;
title('Coordinates of center of mass C_{3}  ^{0}_{0}r_{c3}  vs time t');
xlabel('time t(s)');
ylabel('Coordinates (m)');
legend('X coordinate', 'Y coordinate', 'Z coordinate');
pause;

plot3(x(:,61), x(:,62), x(:,63)); grid on;  axis ([-.2 .2 -.2 .2 -.2 .2]);
title('Position of C.M. C_{3}  ^{0}_{0}r_{c3}');
xlabel('X coordinate (m)');
ylabel('Y coordinate (m)');
zlabel('Z coordinate (m)');
pause;

plot(t, x(:,55),t, x(:,56), t, x(:,57)); grid on;
title('Translational momentum ^{0}_{0}p_{3} vs time t');
xlabel('time t(s)');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;


plot(t, x(:,58), t, x(:,59), t, x(:,60)); grid on;
title('Angular momentum ^{0}_{C3}p_{3} vs time t ');
xlabel('time t(s)');
ylabel('angular momentum components (N-m-s)');
legend('x ang mom', 'y ang mom', 'z ang mom');
pause;

plot3(t, x(:,1), x(:,2), t, x(:,4), x(:,5), t, x(:,7), x(:,8)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{1}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');
pause;

plot3(t, x(:,19), x(:,20)); grid on;axis vis3d;
title('Coordinates of center of mass C_{1}  ^{0}_{0}r_{c1}  vs time t');
xlabel('time t(s)');
ylabel('X Coordinate');
zlabel('Y Coordinate');
pause;

plot3(t, x(:,22), x(:,23), t, x(:,25), x(:,26), t, x(:,28), x(:,29)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{2}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');
pause;

plot3(t, x(:,40), x(:,41)); grid on;axis vis3d;
title('Coordinates of center of mass C_{2}  ^{0}_{0}r_{c2}  vs time t');
xlabel('time t(s)');
ylabel('X Coordinate');
zlabel('Y Coordinate');
pause;

plot3(t, x(:,43), x(:,44), t, x(:,46), x(:,47), t, x(:,49), x(:,50)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');
pause;


plot3(t, x(:,43), x(:,44), t, x(:,46), x(:,47), t, x(:,49), x(:,50)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{3}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');
pause;

plot3(t, x(:,61), x(:,62)); grid on;axis ([0 20 -.2 .2 -.2 .2]);
title('Coordinates of center of mass C_{3}  ^{0}_{0}r_{c3}  vs time t');
xlabel('time t(s)');
ylabel('X Coordinate');
zlabel('Y Coordinate');
pause;

plot3(x(:,73), x(:,74), x(:,75)); grid on; axis([-0.8 0.8 -0.8 0.8 -0.8 0.8]);
title('^{0}_{4}R column 1');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,76), x(:,77), x(:,78)); grid on;axis([-0.8 0.8 -0.8 0.8 -0.8 0.8]); %axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{4}R  column 2');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,79), x(:,80), x(:,81)); grid on;axis([-0.8 0.8 -0.8 0.8 -0.8 0.8]); %axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{4}R  column 3');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,73), x(:,74), x(:,75), x(:,76), x(:,77), x(:,78), x(:,79), x(:,80), x(:,81)); grid on;axis([-0.8 0.8 -0.8 0.8 -0.8 0.8]);% axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{4}R all columns');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot(t, x(:,91), t, x(:,92), t, x(:,93)); grid on;axis equal;
title('Coordinates of center of mass C_{4}  ^{0}_{0}r_{c4}  vs time t');
xlabel('time t(s)');
ylabel('Coordinates (m)');
legend('X coordinate', 'Y coordinate', 'Z coordinate');
pause;

plot3(x(:,91), x(:,92), x(:,93)); grid on;  axis ([-.5 .5 -.5 .5 -.5 .5]);
title('Position of C.M. C_{4}  ^{0}_{0}r_{c4}');
xlabel('X coordinate (m)');
ylabel('Y coordinate (m)');
zlabel('Z coordinate (m)');
pause;

plot(t, x(:,85),t, x(:,86), t, x(:,87)); grid on;
title('Translational momentum ^{0}_{0}p_{4} vs time t');
xlabel('time t(s)');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;


plot(t, x(:,88), t, x(:,89), t, x(:,90)); grid on;
title('Angular momentum ^{0}_{C4}p_{4} vs time t');
xlabel('time t(s)');
ylabel('angular momentum components (N-m-s)');
legend('x ang mom', 'y ang mom', 'z ang mom');
pause;

%%%%%%%------LINK 5 MOVES PARALLEL TO X-AXIS OF FRAME 0-----
plot3(x(:,94), x(:,95), x(:,96)); grid on; axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{5}R column 1');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,97), x(:,98), x(:,99)); grid on; axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{5}R  column 2');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,100), x(:,101), x(:,102)); grid on; axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{5}R  column 3');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot3(x(:,94), x(:,95), x(:,96), x(:,97), x(:,98), x(:,99), x(:,100), x(:,101), x(:,102)); grid on; axis([-0.7 0.7 -0.7 0.7 -0.7 0.7]);
title('^{0}_{5}R all columns');
xlabel('X');
ylabel('Y');
zlabel('Z');
pause;

plot(t, x(:,115), t, x(:,116), t, x(:,117)); grid on;axis equal;
title('Coordinates of center of mass C_{5}  ^{0}_{0}r_{c5}  vs time t');
xlabel('time t(s)');
ylabel('Coordinates (m)');
legend('X coordinate', 'Y coordinate', 'Z coordinate');
pause;

plot3(x(:,115), x(:,116), x(:,117)); grid on;  axis ([-.5 .5 -.5 .5 -.5 .5]);
title('Position of C.M. C_{5}  ^{0}_{0}r_{c5}');
xlabel('X coordinate (m)');
ylabel('Y coordinate (m)');
zlabel('Z coordinate (m)');
pause;

plot(t, x(:,109),t, x(:,110), t, x(:,111)); grid on;
title('Translational momentum ^{0}_{0}p_{5} vs time t');
xlabel('time t(s)');
ylabel('components of momentum (kg-m/s)');
legend('x mom', 'y mom', 'z mom');
pause;


plot(t, x(:,112), t, x(:,113), t, x(:,114)); grid on;
title('Angular momentum ^{0}_{C5}p_{5} vs time t');
xlabel('time t(s)');
ylabel('angular momentum components (N-m-s)');
legend('x ang mom', 'y ang mom', 'z ang mom');
pause;

plot3(t, x(:,73), x(:,74), t, x(:,76), x(:,77), t, x(:,79), x(:,80)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{4}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');
pause;

plot3(t, x(:,91), x(:,92)); grid on;axis ([0 10 -.5 .5 -.5 .5]);
title('Coordinates of center of mass C_{4}  ^{0}_{0}r_{c4}  vs time t');
xlabel('time t(s)');
ylabel('X Coordinate');
zlabel('Y Coordinate');
pause;

plot3(t, x(:,115), x(:,116)); grid on;axis ([0 10 -.7 .7 -.7 .7]);
title('Coordinates of center of mass C_{5}  ^{0}_{0}r_{c5}  vs time t');
xlabel('time t(s)');
ylabel('X Coordinate');
zlabel('Y Coordinate');
pause;

plot3(t, x(:,94), x(:,95), t, x(:,97), x(:,98), t, x(:,100), x(:,101)); grid on;% axis([-1 1 -1 1 -1 1]);
title('^{0}_{5}R unit vectors i, j and k');
xlabel('t');
ylabel('X');
zlabel('Y');
legend('i', 'j', 'k');