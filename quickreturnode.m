%This M-file is the ODE file for crankshaftMain.m

function [out1] = quickreturnode(t,x)
global m1 I1xx I1yy I1zz I1_C1_1 invI1_C1_1 k01 K01 r01 R01 rC1_O1_1 m1g rA1_C1_1 rA1_O1_1...
    m2 I2xx I2yy I2zz I2_C2_2 invI2_C2_2 k12 K12 r12 R12 rC2_A2_2 m2g  l ...
    m3 I3xx I3yy I3zz I3_C3_3 invI3_C3_3 k03 K03 r03 R03 k3C K3C r3C R3C r R k23r K23r r23r R23r m3g rC3_O3_3 kc Kc rc Rc...
    k34 K34 r34 R34 r45 R45 k45 K45 k5C K5C r5C R5C rC4_O4_4 m4g m5g rC5_O5_5 rA4_O4_4 m4 m5 invI4_C4_4 rA33_C3_3 invI5_C5_5 rA4_C4_4...
    rA33_O3_3

%The state vector = x, received after integration from the solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 1 %%%%%%%%%%%%%%%%%%%%
R1_0(:,1) = x(1:3,1);
R1_0(:,2) = x(4:6,1);
R1_0(:,3) = x(7:9,1);
q01_0 = x(10:12,1);% rO1_0_0.
pl1_0 = x(13:15,1);% translational momentum of link 1.
pl1_C1_0 = x(16:18,1);% angular momentum of link 1 about C1 expressed in frame 0.
rC1_0_0 = x(19:21,1);% position of CM of link 1, C1, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
R2_0(:,1) = x(22:24,1);
R2_0(:,2) = x(25:27,1);
R2_0(:,3) = x(28:30,1);
q12_0 = x(31:33,1);
pl2_0 = x(34:36,1);% translational momentum of link 2.
pl2_C2_0 = x(37:39,1);% angular momentum of link 2 about C2 expressed in frame 0.
rC2_0_0 = x(40:42,1);% position of CM of link 2, C2, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%link 3%%%%%%%%%%%%%%%%%%%%%%%%%
R3_0(:,1) = x(43:45,1);
R3_0(:,2) = x(46:48,1);
R3_0(:,3) = x(49:51,1);
q03_0 = x(52:54,1);
pl3_0 = x(55:57,1);% translational momentum of link 3.
pl3_C3_0 = x(58:60,1);% angular momentum of link 3 about C3 expressed in frame 0.
rC3_0_0 = x(61:63,1);% position of CM of link 3, C3, wrt 0 expressed in frame 0.
q3C_3 = x(64:66,1);
q23r_0 = x(67:69,1);
qc_0=x(70:72,1);
%%%%%%%%link 4%%%%%%%%%%%%%
R4_0(:,1) = x(73:75,1);
R4_0(:,2) = x(76:78,1);
R4_0(:,3) = x(79:81,1);
q34_0 = x(82:84,1);
pl4_0 = x(85:87,1);
pl4_C4_0 = x(88:90,1);
rC4_0_0 = x(91:93,1);
%%%%%%%%%%%%%%link5%%%%%%%%%%%%%
R5_0(:,1) = x(94:96,1);
R5_0(:,2) = x(97:99,1);
R5_0(:,3) = x(100:102,1);
q45_0 = x(103:105,1);
q5C_0 = x(106:108,1);
pl5_0 = x(109:111,1);
pl5_C5_0 = x(112:114,1);
rC5_0_0 = x(115:117,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Derivation of System Equations from the Bond graph.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I.   What do the elements give to the system?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 1 %%%%%%%%%%%%%%%%%%%%
eqO1_0 = K01 * q01_0;
vC1_0_0 = (1/m1) * pl1_0;

w1_0_1 = invI1_C1_1 * (R1_0') * pl1_C1_0;
w1_0_0 = R1_0 * w1_0_1;
w1_0_0X = vec2X(w1_0_0);

rO1_C1_1 = -rC1_O1_1;% obtained from parameters input
rO1_C1_0 = R1_0 * rO1_C1_1;
rO1_C1_0X = vec2X(rO1_C1_0);
dq01_0 = -(vC1_0_0 - rO1_C1_0X * w1_0_0);
eR01_0 = R01 * dq01_0;

Sf = [0 0 5]';
dqc_0 = Sf- w1_0_0;

eRc_0 = Rc*dqc_0;


eqc_0 = Kc*qc_0;
Tc = eqc_0+eRc_0;
FO1_0 =  eqO1_0 + eR01_0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
eq12_0 = K12 * q12_0;
vC2_0_0 = (1/m2) * pl2_0;

w2_0_2 = invI2_C2_2 * (R2_0') * pl2_C2_0;
w2_0_0 = R2_0 * w2_0_2;
w2_0_0X = vec2X(w2_0_0);

rA2_C2_2 = -rC2_A2_2;% obtained from parameters input
rA2_C2_0 = R2_0 * rA2_C2_2;
rA2_C2_0X = vec2X(rA2_C2_0);

rA1_C1_0 = R1_0 * rA1_C1_1;
rA1_C1_0X = vec2X(rA1_C1_0);
dq12_0 = (vC2_0_0 - rA2_C2_0X * w2_0_0)-(vC1_0_0 - rA1_C1_0X * w1_0_0);
eR12_0 = R12 * dq12_0;

FA2_0 = -( eq12_0 + eR12_0 );
FA1_0 = - FA2_0; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%link 3%%%%%%%%%%%%%%%%%%%%%

eq3C_3 = K3C*q3C_3;
eqO3_0 = K03*q03_0;
eq23r_0 = K23r*q23r_0;
vC3_0_0 = (1/m3) * pl3_0;

w3_0_3 = invI3_C3_3 * (R3_0') * pl3_C3_0; 
w3_0_0 = R3_0 * w3_0_3;
w3_0_0X =vec2X(w3_0_0);

rC1_O1_0 = R1_0*rC1_O1_1;
rO1_0_0 =  rC1_0_0 -rC1_O1_0;

rA2_0_0 = R1_0 * rA1_O1_1 + rO1_0_0;
rA3_0_0 = rA2_0_0;
rA3_C3_0 = rA3_0_0-rC3_0_0;
rA3_C3_0X = vec2X(rA3_C3_0);

dq3C_3 = -R3_0'*(vC3_0_0 - vC2_0_0 - rA3_C3_0X*w3_0_0);
eR3C_3 = R3C * dq3C_3;

rC3_O3_0 = R3_0 * rC3_O3_3;
rO3_C3_0 = -rC3_O3_0;
rO3_C3_0X = vec2X(rO3_C3_0);
dq03_0 = -(vC3_0_0 - rO3_C3_0X*w3_0_0);
eR03_0 = R03 * dq03_0;

dq23r_0 = (w3_0_0-w2_0_0);
eR23r_0 = R23r * dq23r_0;

FA3_0 = -R3_0*(-eq3C_3 - eR3C_3 );
FO3_0 = eqO3_0 + eR03_0;
%%%%%%%%%%%%%%%%%%%%%link 4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eq34_0 = K34*q34_0;
vC4_0_0 = (1/m4) * pl4_0 ;
w4_0_4 = invI4_C4_4 * (R4_0') * pl4_C4_0; 
w4_0_0 = R4_0 * w4_0_4;
w4_0_0X =vec2X(w4_0_0);
rC4_O4_0 = R4_0 * rC4_O4_4;
rO4_C4_0 = -rC4_O4_0;
rO4_C4_0X = vec2X(rO4_C4_0);

rA33_C3_0 = R3_0*rA33_C3_3 ;
rA33_C3_0X = vec2X(rA33_C3_0);

dq34_0 = -(vC3_0_0 - rA33_C3_0X*w3_0_0) + (vC4_0_0 - rO4_C4_0X*w4_0_0);
eR34_0 = R34*dq34_0;

FA33_0 = eR34_0 + eq34_0 ;
FO4_0 = - FA33_0;
%%%%%%%%%%%%%%%link 5%%%%%%%%%%%%%%%%%%%%
eq45_0 = K45 * q45_0;
vC5_0_0 = (1/m5) * pl5_0;

w5_0_5 = invI5_C5_5 * (R5_0') * pl5_C5_0;
w5_0_0 = R5_0 * w5_0_5;
w5_0_0X = vec2X(w5_0_0);

rO5_C5_5 = -rC5_O5_5;
rO5_C5_0 = R5_0 * rO5_C5_5;
rO5_C5_0X = vec2X(rO5_C5_0);


rA4_C4_0 = R4_0*rA4_C4_4;
rA4_C4_0X = vec2X(rA4_C4_0);
dq45_0 = -(vC4_0_0 - rA4_C4_0X * w4_0_0)+(vC5_0_0 - rO5_C5_0X * w5_0_0);
eR45_0 = R45 * dq45_0;

FO5_0 = -(eq45_0 + eR45_0);
FA4_0 = -FO5_0;


eq5C_0 = K5C*q5C_0;
eR5C_0 = R5C*vC5_0_0;
F5C_0 = eq5C_0 + eR5C_0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%II.   What does the system give to the elements with integral causality?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%link 1%%%%%%%%%%%%%%%%%%%%
dR1_0 = w1_0_0X * R1_0;

dpl1_0 = eqO1_0 + eR01_0 + FA1_0 + m1g;

dpl1_C1_0 = Tc+ rO1_C1_0X * (eqO1_0 + eR01_0) + rA1_C1_0X * FA1_0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
dR2_0 = w2_0_0X * R2_0;

dpl2_0 = - FA3_0 + FA2_0 + m2g;%with gravitational force

dpl2_C2_0 = rA2_C2_0X * FA2_0 + eq23r_0 + eR23r_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 3 %%%%%%%%%%%%%%%%%%%%
dR3_0 = w3_0_0X * R3_0;

dpl3_0 = FA3_0 + FO3_0 +FA33_0+ m3g;

dpl3_C3_0 =  rA33_C3_0X*FA33_0+rA3_C3_0X * FA3_0 + rO3_C3_0X * FO3_0 - eq23r_0 - eR23r_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%link 4%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dR4_0 = w4_0_0X * R4_0;

dpl4_0 = m4g +FO4_0+FA4_0;

dpl4_C4_0 =  rO4_C4_0X*FO4_0+rA4_C4_0X*FA4_0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%link 5%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dR5_0 = w5_0_0X * R5_0;

dpl5_0 = m5g+FO5_0 - F5C_0;

rO5_C5_0 = R5_0 * rO5_C5_5;
rO5_C5_0X = vec2X(rO5_C5_0);
dpl5_C5_0 = rO5_C5_0X * FO5_0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time derivative of the state vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 1 %%%%%%%%%%%%%%%%%%%%
dx(1:3,1) = dR1_0(:,1);
dx(4:6,1) = dR1_0(:,2);
dx(7:9,1) = dR1_0(:,3);
dx(10:12,1) = dq01_0;
dx(13:15,1) = dpl1_0;% rate of translational momentum.
dx(16:18,1) = dpl1_C1_0;% rate of angular momentum of link 1 about C1 expressed in frame 0.
dx(19:21,1) = vC1_0_0;% velocity of CM of link 1, C1, wrt 0 expressed in frame 0. For observation of position of C1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
dx(22:24,1) = dR2_0(:,1);
dx(25:27,1) = dR2_0(:,2);
dx(28:30,1) = dR2_0(:,3);
dx(31:33,1) = dq12_0;% rO2_O22_0.
dx(34:36,1) = dpl2_0;% rate of translational momentum.
dx(37:39,1) = dpl2_C2_0;% rate of angular momentum of link 2 about C2 expressed in frame 0.
dx(40:42,1) = vC2_0_0;% velocity of CM of link 2, C2, wrt 0 expressed in frame 0. For observation of position of C2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 3 %%%%%%%%%%%%%%%%%%%%
dx(43:45,1) = dR3_0(:,1);
dx(46:48,1) = dR3_0(:,2);
dx(49:51,1) = dR3_0(:,3);
dx(52:54,1) = dq03_0;
dx(55:57,1) = dpl3_0;% rate of translational momentum.
dx(58:60,1) = dpl3_C3_0;% rate of angular momentum of link 3 about C3 expressed in frame 0.
dx(61:63,1) = vC3_0_0;% velocity of CM of link 3, C3, wrt 0 expressed in frame 0. For observation of position of C3.
dx(64:66,1) = dq3C_3;
dx(67:69,1) = dq23r_0;
dx(70:72,1) = dqc_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%link 4%%%%%%%%%%%%%%
dx(73:75,1) = dR4_0(:,1);
dx(76:78,1) = dR4_0(:,2);
dx(79:81,1) = dR4_0(:,3);
dx(82:84,1) = dq34_0;
dx(85:87,1) = dpl4_0;
dx(88:90,1) = dpl4_C4_0;
dx(91:93,1) = vC4_0_0;
%%%%%%%%%%%%%%%%%%%%link 5%%%%%%%%%%%%%%%%%%
dx(94:96,1) = dR5_0(:,1);
dx(97:99,1) = dR5_0(:,2);
dx(100:102,1) = dR5_0(:,3);
dx(103:105,1) = dq45_0;
dx(106:108,1) = vC5_0_0;
dx(109:111,1) = dpl5_0;
dx(112:114,1) = dpl5_C5_0;
dx(115:117,1) = vC5_0_0;

out1 = dx;%Output of the ODE file quickreturnode.m, function quickreturnode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
