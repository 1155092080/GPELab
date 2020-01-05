%%% This file is a test for calculating Rb Na BEC mixture in 1D harmonic trap

%% GROUND STATE COMPUTATION FOR RB NA BEC MIXTURE IN 1D HARMONIC TRAP
clear all;
%% Setting the data
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
NNa =58000;
NRb = 300;

%% scattering length
a11 = 54.5*a0;
a22 = 100.4*a0;
a12 = 66.7*a0*0;

%% set trap potential parameters
omgxNa=2*pi*280;
omgyNa=2*pi*280;
omgzNa=2*pi*140;
omgxRb=2*pi*240;
omgyRb=2*pi*240;
omgzRb=2*pi*120;

%% set characteristic parameters
omgmbar = (omgxNa*omgyNa*omgzNa*omgxRb*omgyRb*omgzRb)^(1/6);
abar = sqrt(hbar/mu/omgmbar);
tbar = 1/omgmbar;

%% Set trap potential
vx1=1/2*mNa/mu*omgxNa^2/omgmbar^2;
vy1=1/2*mNa/mu*omgyNa^2/omgmbar^2;
gy1=mNa*grav/sqrt(hbar*omgmbar^3*mu);
vz1=1/2*mNa/mu*omgzNa^2/omgmbar^2;
vx2=1/2*mRb/mu*omgxRb^2/omgmbar^2;
vy2=1/2*mRb/mu*omgyRb^2/omgmbar^2;
gy2=mRb*grav/sqrt(hbar*omgmbar^3*mu);
vz2=1/2*mRb/mu*omgzRb^2/omgmbar^2;

pol=cell(2);
pol{1,1}=@(x,y,z) vx1*x.^2+vy1*(y).^2+vz1*z.^2;
pol{2,2}=@(x,y,z) vx2*x.^2+vy2*(y+gy2/2/vy2-gy1/2/vy1).^2+vz2*z.^2;

%% -----------------------------------------------------------

%% Setting the method and geometry
Computation = 'Ground';
Ncomponents = 2;
Type = 'BESP';
Deltat = 1e-3;
Stop_time = [];
Stop_crit = {'Energy',1e-4};
Method = Method_Var3d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);
xmin = -7;
xmax = 7;
ymin = -7;
ymax = 7;
zmin = -7;
zmax = 7;
Nx = 2^5+1;
Ny = 2^5+1;
Nz = 2^5+1;
Geometry3D = Geometry3D_Var3d(xmin,xmax,ymin,ymax,zmin,zmax,Nx,Ny,Nz);

%% Setting the physical problem
Delta = 0.5;
Beta = 1;

% Set coupled parameter for Rb and Na. Note that Beta_coupled depend on
% atom number
Beta_11=NNa*4*pi*(mu/mNa)*(a11/abar);
Beta_12=NRb*2*pi*(mu/mu)*(a12/abar);
Beta_21=NNa*2*pi*(mu/mu)*(a12/abar);
Beta_22=NRb*4*pi*(mu/mRb)*(a22/abar);

Beta_coupled = [Beta_11, Beta_12; Beta_21, Beta_22];

Physics3D = Physics3D_Var3d(Method, Delta, Beta);
Physics3D = Dispersion_Var3d(Method, Physics3D, [], Dispersion3D);
Physics3D = Potential_Var3d(Method, Physics3D, pol);
Physics3D = Nonlinearity_Var3d(Method, Physics3D, Coupled_Cubic3D(Beta_coupled));
%Coupled_Cubic_energy3D(Beta_coupled)
%% Setting the initial data
InitialData_Choice = 2;
Phi_0 = InitialData_Var3d(Method, Geometry3D, Physics3D, InitialData_Choice);

%% Setting informations and outputs
save = 1;
Outputs = OutputsINI_Var3d(Method, save);
Printing = 1;
Evo = 100;
Draw = 1;
Print = Print_Var3d(Printing,Evo,Draw);

%% -----------------------------------------------------------
% Launching simulation
%-----------------------------------------------------------

[Phi, Outputs] = GPELab3d(Phi_0,Method,Geometry3D,Physics3D,Outputs,[],Print);