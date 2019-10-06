% MAIN FILE for the mathematical model for dynamics of quick return mechanism.
global m1 I1xx I1yy I1zz I1_C1_1 invI1_C1_1 k01 K01 r01 R01 rC1_O1_1 m1g rA1_C1_1 rA1_O1_1...
    m2 I2xx I2yy I2zz I2_C2_2 invI2_C2_2 k12 K12 r12 R12 rC2_A2_2 m2g  l ...
    m3 I3xx I3yy I3zz I3_C3_3 invI3_C3_3 k03 K03 r03 R03 k3C K3C r3C R3C r R k23r K23r r23r R23r m3g rC3_O3_3 kc Kc rc Rc...
    k34 K34 r34 R34 r45 R45 k45 K45 k5C K5C r5C R5C rC4_O4_4 m4g m5g rC5_O5_5 rA4_O4_4 m4 m5 invI4_C4_4 rA33_C3_3 invI5_C5_5 rA4_C4_4...
    rA33_O3_3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%INTERVAL OF INTEGRATION
tspan = linspace(0,5,10000);%[0 5];
%INPUT PARAMETERS
%g = [0 0 0]';
g = [0 -9.81 0]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%link1 properties
%%%%%%%%%%%%%%%%%%%% link 1 %%%%%%%%%%%%%%%%%%%%
m1 = 0.5;
M1 = m1*eye(3);
lx = 0.2; ly = 0.01; lz = 0.01;%dimensions of link 1 in frame 1.
I1xx = m1*(ly^2 + lz^2)/12; I1yy = m1*(lx^2 + lz^2)/12; I1zz = m1*(ly^2 + lx^2)/12;
I1_C1_1 = [I1xx 0 0; 0 I1yy 0; 0 0 I1zz];
invI1_C1_1 = inv(I1_C1_1);
m1g = m1*g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Stiffness of link 1
k01 = 100000;%n1;%100000;%
K01 = k01*eye(3);
kc = 100;
Kc = kc*eye(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Damping of link 1
r01 = 20;%n2;%%50;
R01 = r01*eye(3);
rc = 100;
Rc =rc*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initial Angle of link 1
th1 = pi/2;%n3;%
cth1 = cos(th1); sth1 = sin(th1);
dth1 = 0;%initial rate of change of th1:at rest
R1_0 = [cth1 -sth1 0; sth1 cth1 0; 0 0 1];%Initial values of R1_0 made available
dR1_0 = dth1*[-sth1 -cth1 0; cth1 -sth1 0; 0 0 0];
w1_0_0X = dR1_0*R1_0';
w1_0_0 = X2vec(w1_0_0X);%[0; 0; dth1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position Vectors
rO1_0_0 = [0 0 0]';%position of origin O1 of frame 1 wrt 0, expressed in 0. Chosen to coincide with 0 initially.
rC1_O1_1 = [lx/2 0 0]';%position of CM C1 in frame 1
rC1_O1_0 = R1_0 * rC1_O1_1;
rC1_0_0 = rC1_O1_0 + rO1_0_0;%in this case, as origins of frame 0 and 1 coincide.
%Position Vector of end point of link 1
rA1_O1_1 = [lx 0 0]';%position of A1 in frame 1
rA1_C1_1 = rA1_O1_1 - rC1_O1_1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocities
vO1_0_0 = [0 0 0]';%velocity of origin O1 of frame 1 wrt 0, expressed in 0. Chosen to be at rest initially.
vC1_O1_0 = w1_0_0X * rC1_O1_0;%translational velocity of C1 wrt O1.
vC1_0_0 = vC1_O1_0 + vO1_0_0;%translational velocity of C1 wrt O.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%States
pl1_0 = m1*vC1_0_0;%initial translational momentum of link 1.
pl1_C1_0 = R1_0 * I1_C1_1 * R1_0'* w1_0_0;%angular momentum of link 1 about C1 expressed in frame 0.
q01_0 = rO1_0_0;

qc_0 = [0 0 0]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%
m2 = 0.1;
M2 = m2*eye(3);
lx2 = 0.01; ly2 = 0.01; lz2 = 0.01;%dimensions of link 2 in frame 2.
I2xx = m2*(ly2^2 + lz2^2)/12; I2yy = m2*(lx2^2 + lz2^2)/12; I2zz = m2*(ly2^2 + lx2^2)/12;
I2_C2_2 = [I2xx 0 0; 0 I2yy 0; 0 0 I2zz];
invI2_C2_2 = inv(I2_C2_2);
m2g = m2*g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Stiffness of link 2
k12 = 100000;%n4;%100000;%
K12 = k12*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Damping of link 2
r12 = 20;%n5;%;%50;20;%
R12 = r12*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initial Angle of link 2
l = 0.4;%seperation between fixed ends of link 1 and link 3. It is assumed that fixed end of link 1 and that of link 3 lie on the same
% vertical line(along the y0 axis)
tth1 = sth1/cth1;%tangent of th1
th2 =  atan(l/(lx*cth1)+(lx*tth1))-th1;%calculation of th2 based on geometry
cth2 = cos(th2); sth2 = sin(th2);
dth2 = 0;%initial rate of change of th2:at rest
R2_1 = [cth2 -sth2 0; sth2 cth2 0; 0 0 1];%Initial values of R2_1 made available
R2_0 = R1_0 * R2_1;
dR2_1 = dth2*[-sth2 -cth2 0; cth2 -sth2 0; 0 0 0];
w2_1_1X = dR2_1*R2_1';
w2_1_1 = X2vec(w2_1_1X);%The above code could have been replaced by the simple expression w2_1_1 = [0 0 dth2]'
w2_0_0 = R1_0 * w2_1_1 + w1_0_0;
w2_0_0X = vec2X(w2_0_0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position Vectors
rA2_0_0 = R1_0 * rA1_O1_1 + rO1_0_0;% position of origin A2 of frame 2 wrt 0, expressed in 0. Chosen to coincide with A1 initially.
rC2_A2_2 = [0 0 0]';%position of CM C2 in frame 2:made to coincide with A2
rC2_A2_0 = R2_0 * rC2_A2_2;
rC2_0_0 = rA2_0_0 + rC2_A2_0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocities
vA2_0_0 = [0 0 0]';% velocity of origin A2 of frame 2 wrt 0, expressed in 0.Chosen to be at rest initially.
vC2_A2_0 = w2_0_0X * rC2_A2_0;%translational velocity of C2 wrt A2.
vC2_0_0 = vC2_A2_0 + vA2_0_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%States
pl2_0 = m2*vC2_0_0;%initial translational momentum of link 2.
pl2_C2_0 = R2_0 * I2_C2_2 * R2_0'* w2_0_0;%angular momentum of link 2 about C2 expressed in frame 0.
rA1_O1_0 = R1_0 * rA1_O1_1;%rA1_O1_1 is calculated earlier
rA1_0_0 = rA1_O1_0 + rO1_0_0;
q12_0 = rA1_0_0 - rA2_0_0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%% link 3 %%%%%%%%%%%%%%%%%%%
m3 = 0.7;
M3 = m3*eye(3);
lx3 = 0.7; ly3 = 0.01; lz3 = 0.01;% dimensions of link 3 in frame 3.
I3xx = m3*(ly3^2 + lz3^2)/12; I3yy = m3*(lx3^2 + lz3^2)/12; I3zz = m3*(ly3^2 + lx3^2)/12;
I3_C3_3 = [I3xx 0 0; 0 I3yy 0; 0 0 I3zz];
invI3_C3_3 = inv(I3_C3_3);
m3g = m3*g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Stiffness of link 3
k03 = 100000;%n6;%100000;%
K03 = k03*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Damping of link 3
r03 =20;%n7;%%50;20;%
R03 = r03*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k3C =100000;%n8;%
K3C = k3C*eye(3); K3C(1,1) = 0;
r3C = 20;%n9;%%50;
R3C = r3C*eye(3);% R3C(1,1) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k23r= 100;%n11;%100;
K23r = k23r*eye(3);
r23r= 0.5;%n12;%%5;%20;
R23r = r23r*eye(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Angle between link 2 and link 3
th3 = 0;%X2 and X3 coincide
cth3 = cos(th3); sth3 = sin(th3);
dth3 = 0; %initial rate of change of th3: rest
R3_2 = [cth3 -sth3 0; sth3 cth3 0; 0 0 1];%Initial values of R3_2 made available
R3_0 = R1_0 * R2_1* R3_2;
dR3_2 = dth3*[-sth3 -cth3 0; cth3 -sth3 0; 0 0 0];
w3_2_2X = dR3_2*R3_2';
w3_2_2 = X2vec(w3_2_2X);%The above code could have been replaced by the simple expression w3_2_2 = [0 0 dth3]'
w3_0_0 = R1_0 * R2_1 * w3_2_2 + w2_0_0;
w3_0_0X = vec2X(w3_0_0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position Vectors - defining the origin of link 3
r03_0_0 = [0 -l 0]';%position of 03 wrt 0 at a distance of -l in frame 0

rO3_03_0 = [0 0 0]';%position of origin O3 of frame 3 wrt 03, expressed in 0. Chosen to coincide with 03 initially.
rO3_0_0 = rO3_03_0 + r03_0_0;
rC3_O3_3 = [lx3/2 0 0]';%position of CM C3 in frame 3
rC3_O3_0 = R3_0 * rC3_O3_3;
rC3_0_0 = rC3_O3_0 + rO3_0_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position Vector of the point of link 3 that connects it to link 2 - point A3
rA3_0_0 = rA2_0_0;
rA3_C3_0 = rA3_0_0 - rC3_0_0;
rA3_C3_3 = R3_0' * rA3_C3_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocities
vO3_0_0 = [0 0 0]';
vC3_O3_0 = w3_0_0X * rC3_O3_0;
vA3_0_0= vA2_0_0;
vC3_0_3 = [0 0 0]';
vA3_0_3 = R3_0'*vA3_0_0;
vA3_C3_3 = vA3_0_3-vC3_0_3;
vC3_0_0 = vA3_0_0 - (w3_0_0X * rA3_C3_0) - (R3_0 * vA3_C3_3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%States
pl3_0 = m3 * vC3_0_0;% initial translational momentum of link 3.
pl3_C3_0 = R3_0 * I3_C3_3 * R3_0'* w3_0_0;% angular momentum of link 3 about C3 expressed in frame 0.
q03_0 = rO3_03_0;
q3C_3 = rA3_C3_3;
q23r_0 = [0 0 (th3-th2)]';
rA33_O3_3 = [lx3 0 0]';
rA33_C3_3 = rA33_O3_3 -rC3_O3_3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% link 4 %%%%%%%%%%%%%%%%%%%%
m4 = .3;
M4 = m4*eye(3);
lx4 = .4; ly4 = 0.01; lz4 = 0.01;
I4xx = m4*(ly4^2 + lz4^2)/12; I4yy = m4*(lx4^2 + lz4^2)/12; I4zz = m4*(ly4^2 + lx4^2)/12;
I4_C4_4 = [I4xx 0 0; 0 I4yy 0; 0 0 I4zz];
invI4_C4_4 = inv(I4_C4_4);
m4g = m4*g;

k34 = 100000;%1000;
K34 = k34*eye(3);
r34 = 20;%50;%20;
R34 = r34*eye(3);
l1 = 0;%0.2;
th4 = 2*pi - (th1+th2)-(asin((lx3/lx4)*sin(th1+th2)-((l1+l)/lx4)));

cth4 = cos(th4); sth4 = sin(th4);

dth4 = 0; 

R4_3 = [cth4 -sth4 0; sth4 cth4 0; 0 0 1];
R4_0 = R1_0 * R2_1* R3_2*R4_3;

dR4_3 = dth4*[-sth4 -cth4 0; cth4 -sth4 0; 0 0 0];
w4_3_3X = dR4_3*R4_3';
w4_3_3 = X2vec(w4_3_3X);
w4_0_0 = R3_0* w4_3_3 + w3_0_0;
w4_0_0X = vec2X(w4_0_0);
rA33_O3_3 = [lx3 0 0]';
rO4_0_0 = R3_0*rA33_O3_3 + rO3_0_0;
rC4_O4_4 = [lx4/2 0 0]';
rC4_O4_0 = R4_0*rC4_O4_4;
rC4_0_0 = rC4_O4_0 +rO4_0_0;

rA4_O4_4 = [lx4 0 0]';
rA4_C4_4 = rA4_O4_4 - rC4_O4_4;


vO4_0_0 = [0 0 0]';
vC4_O4_0 = w4_0_0X * rC4_O4_0;
vC4_0_0 = vC4_O4_0 + vO4_0_0;

pl4_0 = m4*vC4_0_0;

pl4_C4_0 = R4_0 * I4_C4_4 * R4_0'* w4_0_0;

rA33_O3_0 = R3_0 * rA33_O3_3;
rA33_0_0 = rA33_O3_0 + rO3_0_0;
q34_0 = rA33_0_0 - rO4_0_0;%
%%%%%%%%%%%%%%%%%%%%%%%%link 5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m5 = 0.1;
M5 = m5*eye(3);
lx5 = .01; ly5 = 0.01; lz5 = 0.01;
I5xx = m5*(ly5^2 + lz5^2)/12; I5yy = m5*(lx5^2 + lz5^2)/12; I5zz = m5*(ly5^2 + lx5^2)/12;
I5_C5_5 = [I5xx 0 0; 0 I5yy 0; 0 0 I5zz];
invI5_C5_5 = inv(I5_C5_5);
m5g = m5*g;

k45 = 100000;%5000;
K45 = k45*eye(3); 
r45 = 20;%50;%20;
R45 = r45*eye(3); 

k5C = 100000;%5000;
K5C = k3C*eye(3); K5C(1,1) = 0;
r5C = 20;%50;%20;
R5C = r5C*eye(3);

th5 = 2*pi - (th1+th2+th4);

cth5 = cos(th5); sth5 = sin(th5);

dth5 = 0; 

R5_4 = [cth5 -sth5 0; sth5 cth5 0; 0 0 1];
R5_0 = R1_0 * R2_1* R3_2*R4_3*R5_4;

dR5_4 = dth5*[-sth5 -cth5 0; cth5 -sth5 0; 0 0 0];
w5_4_4X = dR5_4*R5_4';
w5_4_4 = X2vec(w5_4_4X);
w5_0_0 = R4_0* w5_4_4 + w4_0_0;
w5_0_0X = vec2X(w5_0_0);


rO5_0_0 = R4_0 * rA4_O4_4 + rO4_0_0;
rC5_O5_5 = [0 0 0]';
rC5_O5_0 = R5_0 * rC5_O5_5;
rC5_0_0 = rC5_O5_0 + rO5_0_0;

vC5_O5_0 = w5_0_0X * rC5_O5_0;
vC5_0_0 = vC5_O5_0 ; 
pl5_0 = m5*vC5_0_0;% initial translational momentum.

pl5_C5_0 = R5_0 * I5_C5_5 * R5_0'* w5_0_0;

rA4_O4_0 = R4_0 * rA4_O4_4;
rA4_0_0 = rO4_0_0 + rA4_O4_0;
q45_0 = rA4_0_0 - rO5_0_0;
q5C_0 = q45_0;% which works out to [0 0 0]' initially

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INITIAL CONDITIONS, at t = 0,
x0(1:3,1) = R1_0(:,1);
x0(4:6,1) = R1_0(:,2);
x0(7:9,1) = R1_0(:,3);
x0(10:12,1) = q01_0;% rO1_0_0.
x0(13:15,1) = pl1_0;%initial translational momentum of link 1.
x0(16:18,1) = pl1_C1_0;%angular momentum of link 1 about C1 expressed in frame 0.
x0(19:21,1) = rC1_0_0;%position of CM of link 1, C1, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0(22:24,1) = R2_0(:,1);
x0(25:27,1) = R2_0(:,2);
x0(28:30,1) = R2_0(:,3);
x0(31:33,1) = q12_0;
x0(34:36,1) = pl2_0;%translational momentum of link 2.
x0(37:39,1) = pl2_C2_0;%angular momentum of link 2 about C2 expressed in frame 0.
x0(40:42,1) = rC2_0_0;%position of CM of link 2, C2, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0(43:45,1) = R3_0(:,1);
x0(46:48,1) = R3_0(:,2);
x0(49:51,1) = R3_0(:,3);
x0(52:54,1) = q03_0;
x0(55:57,1) = pl3_0;%translational momentum of link 3.
x0(58:60,1) = pl3_C3_0;%angular momentum of link 3 about C3 expressed in frame 0.
x0(61:63,1) = rC3_0_0;%position of CM of link 3, C3, wrt 0 expressed in frame 0.
x0(64:66,1) = q3C_3;
x0(67:69,1) = q23r_0;
x0(70:72,1) = qc_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0(73:75,1) = R4_0(:,1);
x0(76:78,1) = R4_0(:,2);
x0(79:81,1) = R4_0(:,3);
x0(82:84,1) = q34_0;
x0(85:87,1) = pl4_0;
x0(88:90,1) = pl4_C4_0;
x0(91:93,1) = rC4_0_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0(94:96,1) = R5_0(:,1);
x0(97:99,1) = R5_0(:,2);
x0(100:102,1) = R5_0(:,3);
x0(103:105,1) = q45_0;
x0(106:108,1) = q5C_0;
x0(109:111,1) = pl5_0;
x0(112:114,1) = pl5_C5_0;
x0(115:117,1) = rC5_0_0;

%CALLING THE SOLVER
options = odeset('OutputFcn', 'odeplot', 'RelTol',1e-4,'AbsTol',1e-8, 'OutputSel', [1 2 3 4]);
%tic;[t,x] = ode45('quickreturnode', tspan, x0, options);toc
tic;[t,x] = ode15s('quickreturnode', tspan, x0, options);toc
[FO1_0 FA1_0 FA2_0 FA3_0 FO3_0 ] = morequickreturn(t,x);
[FA33_0 FO4_0 FA4_0 FO5_0 F5C_0] = more2quickreturn(t,x);
[Tc] = torquequickreturn(t,x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOTTING RESULTS
quickreturnplotgraphs;
plotmore;
plotmore2;
plottorque;