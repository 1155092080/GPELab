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
NNa = 40000;
NRb = 40000;

%% scattering length
a11 = 54.5*a0;
a22 = 100.4*a0;
a12 = -30*a0;

%% set trap potential parameters
omgxNa=2*pi*10;
omgxRb=2*pi*10;

%% set characteristic parameters
omgmbar = (omgxNa*omgxRb)^(1/2);
abar = sqrt(hbar/mu/omgmbar);
tbar = 1/omgmbar;

%% Set trap potential
vx1 = 1/2*mNa/mu*omgxNa^2/omgmbar^2;
vx2 = 1/2*mRb/mu*omgxRb^2/omgmbar^2;

pol = cell(2);
pol{1,1} = @(x) vx1*x.^2;
pol{2,2} = @(x) vx2*x.^2;

%% -----------------------------------------------------------

%% Setting the method and geometry
Computation = 'Ground';
Ncomponents = 2;
Type = 'BESP';
Deltat = 5e-3;
Stop_time = [];
Stop_crit = {'Energy',1e-3};
Method = Method_Var1d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);
xmin = -10;
xmax = 10;
Nx = 2^8+1;
Geometry1D = Geometry1D_Var1d(xmin,xmax,Nx);

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

Physics1D = Physics1D_Var1d(Method, Delta, Beta);
Physics1D = Dispersion_Var1d(Method, Physics1D, [], Dispersion1D);
Physics1D = Potential_Var1d(Method, Physics1D, pol);
Physics1D = Nonlinearity_Var1d(Method, Physics1D, Coupled_Cubic1D(Beta_coupled),[],Coupled_Cubic_energy1D(Beta_coupled));

%% Setting the initial data
InitialData_Choice = 2;
Phi_0 = InitialData_Var1d(Method, Geometry1D, Physics1D, InitialData_Choice);

%% Setting informations and outputs
save = 1;
Outputs = OutputsINI_Var1d(Method, save);
Printing = 1;
Evo = 50;
Draw = 1;
Print = Print_Var1d(Printing,Evo,Draw);

%% -----------------------------------------------------------
% Launching simulation
%-----------------------------------------------------------

[Phi, Outputs] = GPELab1d(Phi_0,Method,Geometry1D,Physics1D,Outputs,[],Print);