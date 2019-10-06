function [Tc] = torquequickreturn(t,x);
global m1 I1xx I1yy I1zz I1_C1_1 invI1_C1_1 k01 K01 r01 R01 rC1_O1_1 m1g rA1_C1_1 rA1_O1_1...
    m2 I2xx I2yy I2zz I2_C2_2 invI2_C2_2 k12 K12 r12 R12 rC2_A2_2 m2g  l ...
    m3 I3xx I3yy I3zz I3_C3_3 invI3_C3_3 k03 K03 r03 R03 k3C K3C r3C R3C r R k23r K23r r23r R23r m3g rC3_O3_3 kc Kc rc Rc...
    k34 K34 r34 R34 r45 R45 k45 K45 k5C K5C r5C R5C rC4_O4_4 m4g m5g rC5_O5_5 rA4_O4_4 m4 m5 invI4_C4_4 rA33_C3_3 invI5_C5_5 rA4_C4_4...
    rA33_O3_3
for j = 1:length(t)
    R1_0(:,1) = x(j,1:3);
R1_0(:,2) = x(j,4:6);
R1_0(:,3) = x(j,7:9);

q01_0(1:3,1) = x(j,10:12);% rO1_0_0.
pl1_0(1:3,1) = x(j,13:15);% translational momentum of link 1.
pl1_C1_0(1:3,1) = x(j,16:18);% angular momentum of link 1 about C1 expressed in frame 0.
rC1_0_0(1:3,1) = x(j,19:21);% position of CM of link 1, C1, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
R2_0(:,1) = x(j,22:24);
R2_0(:,2) = x(j,25:27);
R2_0(:,3) = x(j,28:30);
q12_0(1:3,1) = x(j,31:33);
pl2_0(1:3,1) = x(j,34:36);% translational momentum of link 2.
pl2_C2_0(1:3,1) = x(j,37:39);% angular momentum of ljnk 2 about C2 expressed in frame 0.
rC2_0_0(1:3,1) = x(j,40:42);% position of CM of link 2, C2, wrt 0 expressed in frame 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%link 3%%%%%%%%%%%%%%%%%%%%%%%%%
R3_0(:,1) = x(j,43:45);
R3_0(:,2) = x(j,46:48);
R3_0(:,3) = x(j,49:51);
q03_0(1:3,1) = x(j,52:54);
pl3_0(1:3,1) = x(j,55:57);% translational momentum of link 3.
pl3_C3_0(1:3,1) = x(j,58:60);% angular momentum of link 3 about C3 expressed in frame 0.
rC3_0_0(1:3,1) = x(j,61:63);% position of CM of link 3, C3, wrt 0 expressed in frame 0.
q3C_3(1:3,1) = x(j,64:66);
q23r_0(1:3,1) = x(j,67:69);
qc_0(1:3,1)=x(j,70:72);
%%%%%%%%link 4%%%%%%%%%%%%%
R4_0(:,1) = x(j,73:75);
R4_0(:,2) = x(j,76:78);
R4_0(:,3) = x(j,79:81);
q34_0(1:3,1) = x(j,82:84);
pl4_0(1:3,1) = x(j,85:87);
pl4_C4_0(1:3,1) = x(j,88:90);
rC4_0_0(1:3,1) = x(j,91:93);
%%%%%%%%%%%%%%link5%%%%%%%%%%%%%
R5_0(:,1) = x(j,94:96);
R5_0(:,2) = x(j,97:99);
R5_0(:,3) = x(j,100:102);
q45_0(1:3,1) = x(j,103:105);
q5C_0(1:3,1) = x(j,106:108);
pl5_0(1:3,1) = x(j,109:111);
pl5_C5_0(1:3,1) = x(j,112:114);
rC5_0_0(1:3,1) = x(j,115:117);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
eqc_0 = Kc*qc_0;
eRc_0 = Rc*dqc_0;
Tc(1:3,j) = eqc_0 + eRc_0;

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

FA33_0= eR34_0 + eq34_0 ;
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

dpl1_0 = eqO1_0 + eR01_0 + FA1_0 + m1g;%with gravitational force

%torque1 = [0 0 2]';%[0 0 .2*(1- 2.73.^(-t/10))]';%[0 0 0]';%no torque%
dpl1_C1_0 = Tc(1:3,j)+ rO1_C1_0X * (eqO1_0 + eR01_0) + rA1_C1_0X * FA1_0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 2 %%%%%%%%%%%%%%%%%%%%
dR2_0 = w2_0_0X * R2_0;

dpl2_0 = - FA3_0 + FA2_0 + m2g;%with gravitational force

dpl2_C2_0 = rA2_C2_0X * FA2_0 + eq23r_0 + eR23r_0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% link 3 %%%%%%%%%%%%%%%%%%%%
dR3_0 = w3_0_0X * R3_0;

dpl3_0 = FA3_0 + FO3_0 +  FA33_0 + m3g;

dpl3_C3_0 =  rA33_C3_0X*FA33_0 +rA3_C3_0X * FA3_0 + rO3_C3_0X * FO3_0 - eq23r_0 - eR23r_0;


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
end

[Tc]; %= dx;%Output of the ODE file quickreturnode.m, function quickreturnode


