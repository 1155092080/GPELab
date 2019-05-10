%% Set Physics constants and atomic properties for simulation
%% INPUTS:
%%          NONE
%% OUTPUTS:
%%          conditions
%%

function conditions = SetParameters()
%% Constants
grav=9.8;
hbar = 6.62606896E-34/2/pi;
epsilon0 = 8.854187817E-12; 
me = 9.10938215E-31;
e = 1.602176487E-19;
a0 = 4*pi*epsilon0*hbar^2/(me*e^2);
AMU = 1.6605402E-27;

%% Atom species
mNa = 23*AMU;
mRb = 87*AMU;
mu = mNa*mRb/(mNa+mRb);

%% atom numbers
NNa=9151;
NRb=22524;

%% Set dispersion(mass dependent) relations


%% set trap potential parameters

omgxNa=2*pi*129;
omgyNa=2*pi*149;
omgzNa=2*pi*59.5;

omgxRb=2*pi*112.5;
omgyRb=2*pi*130;
omgzRb=2*pi*52;

%% set characteristic parameters
omgmbar = (omgxNa*omgyNa*omgzNa*omgxRb*omgyRb*omgzRb)^(1/6);
abar = sqrt(hbar/mu/omgm);
tbar = 1/omgm;

conditions.vx1=1/2*mNa/mu*omgxNa^2/omgm^2;
conditions.vy1=1/2*mNa/mu*omgyNa^2/omgm^2;
conditions.gy1=mNa*grav/sqrt(hbar*omgm^3*mu);
conditions.vz1=1/2*mNa/mu*omgzNa^2/omgm^2;
conditions.vx2=1/2*mRb/mu*omgxRb^2/omgm^2;
conditions.vy2=1/2*mRb/mu*omgyRb^2/omgm^2;
conditions.gy2=mRb*grav/sqrt(hbar*omgm^3*mu);
conditions.vz2=1/2*mRb/mu*omgzRb^2/omgm^2;

vx1=1/2*mNa/mu*omgxNa^2/omgm^2;
vy1=1/2*mNa/mu*omgyNa^2/omgm^2;
gy1=mNa*grav/sqrt(hbar*omgm^3*mu);
vz1=1/2*mNa/mu*omgzNa^2/omgm^2;
vx2=1/2*mRb/mu*omgxRb^2/omgm^2;
vy2=1/2*mRb/mu*omgyRb^2/omgm^2;
gy2=mRb*grav/sqrt(hbar*omgm^3*mu);
vz2=1/2*mRb/mu*omgzRb^2/omgm^2;

pol=cell(2);
pol{1,1}=@(x,y,z) vx1*x.^2+vy1*(y).^2+vz1*z.^2;
pol{2,2}=@(x,y,z) vx2*x.^2+vy2*(y+gy2/2/vy2-gy1/2/vy1).^2+vz2*z.^2;

%% set interaction parameters
a11=54.5*a0;
a22=100.4*a0;
a12=-27.8*a0;
conditions.potential=pol;
conditions.Beta_11=NNa*4*pi*(mu/mNa)*(a11/a);
conditions.Beta_22=NRb*4*pi*(mu/mRb)*(a22/a);
conditions.Beta_12=NRb*2*pi*(mu/mu)*(a12/a);
conditions.Beta_21=NNa*2*pi*(mu/mu)*(a12/a);

%% set calcultion parameters

conditions.pointsintrap = 2^7+1;
conditions.pointstof = 2^7+1;
conditions.lengthintrap = 12;
conditions.lengthtof = conditions.lengthintrap*(conditions.pointstof-1)/(conditions.pointsintrap-1);
conditions.timestep = 0.01;
conditions.stoptime = 7;
conditions.savestep = 1;

end