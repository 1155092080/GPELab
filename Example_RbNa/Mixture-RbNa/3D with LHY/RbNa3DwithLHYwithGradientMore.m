%%% This file is a continuing calculating from 
%% Setting the data
%% Constants
%grav=9.8; % For usual gravitation
%grav = 0; % For free falling
g1 = 0.5;
g2 = - g1 * 23/87;
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
NNa =100000;
NRb = 140000;

%% scattering length
a11 = 54.5*a0;
a22 = 100.4*a0;
a12 = -70*a0;

%% set trap potential parameters
omgxNa=2*pi*1e-6;
omgyNa=2*pi*1e-6;
omgzNa=2*pi*1e-6;
omgxRb=2*pi*1e-6;
omgyRb=2*pi*1e-6;
omgzRb=2*pi*1e-6;

%% set characteristic parameters
%omgmbar = (omgxNa*omgyNa*omgzNa*omgxRb*omgyRb*omgzRb)^(1/6);%characteristic time by trap
omgmbar = 2*pi*100; % user defined characteristic time
abar = sqrt(hbar/mu/omgmbar);
tbar = 1/omgmbar;

%% Set trap potential
vx1=1/2*mNa/mu*omgxNa^2/omgmbar^2;
%vy1=1/2*mNa/mu*omgyNa^2/omgmbar^2;
%gy1=mNa*grav/sqrt(hbar*omgmbar^3*mu);
%gy1=mNa*g1/sqrt(hbar*omgmbar^3*mu);
vz1=1/2*mNa/mu*omgzNa^2/omgmbar^2;
vx2=1/2*mRb/mu*omgxRb^2/omgmbar^2;
%vy2=1/2*mRb/mu*omgyRb^2/omgmbar^2;
%gy2=mRb*grav/sqrt(hbar*omgmbar^3*mu);
%gy2=mRb*g2/sqrt(hbar*omgmbar^3*mu);
vz2=1/2*mRb/mu*omgzRb^2/omgmbar^2;

grad1 = g1*mNa/sqrt(hbar*mu*(omgmbar^3));
grad2 = g2*mRb/sqrt(hbar*mu*(omgmbar^3));

pol=cell(2);
pol{1,1}=@(x,y,z) vx1*x.^2+ grad1 * y +vz1*z.^2;
%pol{2,2}=@(x,y,z) vx2*x.^2+vy2*(y+gy2/2/vy2-gy1/2/vy1).^2+vz2*z.^2;
pol{2,2}=@(x,y,z) vx2*x.^2+ grad2 * y +vz2*z.^2;

%% -----------------------------------------------------------

%% Setting the method and geometry
%Setting Method
Computation = 'Ground';
Ncomponents = 2;
Type = 'BESP';
Deltat = 5e-4;
Stop_time = [];
Stop_crit = {'Energy',1e-2};
Method = Method_Var3d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);

%Setting Geometry
limit = 4.5;
xmin = -limit;
xmax = limit;
ymin = -limit;
ymax = limit;
zmin = -limit;
zmax = limit;
Nx = 2^5+1;
Ny = 2^5+1;
Nz = 2^5+1;
Geometry3D = Geometry3D_Var3d(xmin,xmax,ymin,ymax,zmin,zmax,Nx,Ny,Nz);

%% Setting the physical problem
Delta = 0.5;
Beta = 1;

% Set coupled parameter for Rb and Na. Note that Beta_coupled depend on atom number
%Beta for mean field energy
Beta_11=NNa*4*pi*(mu/mNa)*(a11/abar);
Beta_12=NRb*2*pi*(mu/mu)*(a12/abar);
Beta_21=NNa*2*pi*(mu/mu)*(a12/abar);
Beta_22=NRb*4*pi*(mu/mRb)*(a22/abar);
Beta_coupled = [Beta_11, Beta_12; Beta_21, Beta_22];
%Gamma and Etta for LHY term
Gamma_1 =(NNa*a11/abar)*(mu/mNa)^(2/5);
Gamma_2 = (NRb*a22/abar)*(mu/mRb)^(2/5);
Gamma_coupled = [Gamma_1, Gamma_2]; 
Etta_1 = (a11/abar)*(mu/mNa)^(2/5) * 128 * pi^(1/2) / 3;
Etta_2 = (a22/abar)*(mu/mRb)^(2/5) * 128 * pi^(1/2) / 3;
Etta_coupled = [Etta_1, Etta_2];

Physics3D = Physics3D_Var3d(Method, Delta, Beta);
Physics3D = Dispersion_Var3d(Method, Physics3D, [], Dispersion3D);
Physics3D = Potential_Var3d(Method, Physics3D, pol);
Physics3D = Nonlinearity_Var3d(Method, Physics3D, Coupled_withLHY_3D(Beta_coupled, Gamma_coupled, Etta_coupled));

%% Setting informations and outputs
save = 1;
Outputs = OutputsINI_Var3d(Method, save);
Printing = 1;
Evo = 100;
Draw = 1;
Print = Print_Var3d(Printing,Evo,Draw);
% set Figure parameters for 

View = 3;
Isovalue = 1e-2;
Alpha = 0.4;
Map = 'jet';
Figure = Figure_Var3d(View,Isovalue,Alpha,'map',Map);

%% -----------------------------------------------------------
% Launching simulation
%-----------------------------------------------------------

[Phi, Outputs] = GPELab3d(Phi_0,Method,Geometry3D,Physics3D,Outputs,[],Print,Figure);