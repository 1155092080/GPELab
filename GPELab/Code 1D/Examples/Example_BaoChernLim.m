%%% This file is an example of how to use GPELab

%% Ground state of Gross-Pitaevskii equation with optical potential (see W. Bao, I-L. Chern, F.Y. Lim, 
%% 'Efficient and spectrally accurate numerical methods for computing ground and first excited states in Bose-Einstein condensates', Journal of Computational Physics, Vol. 219, No. 2, pp. 836-854 (2006))


clear all;
%-----------------------------------------------------------
% Setting the data
%-----------------------------------------------------------

%% Setting the method and geometry
Computation = 'Ground';
Ncomponents = 2;
Type = 'BESP';
Deltat = 5e-4;
Stop_time = [];
Stop_crit = {'Energy',1e-5};
Method = Method_Var1d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);
xmin = -1;
xmax = 1;
Nx = 2^10+1;
Geometry1D = Geometry1D_Var1d(xmin,xmax,Nx);

%% Setting the physical problem
Delta = 0.5;
Beta = 500;

Beta_coupled = [-0.2,0;0,-0.1];
Coupled_NL{1,1} = @(Phi,X) Beta_coupled(1,1)*abs(Phi{1}).^2 + Beta_coupled(1,2)*abs(Phi{2}).^2;
Coupled_NL{1,2} = @(Phi,X) 0;
Coupled_NL{2,1} = @(Phi,X) 0;
Coupled_NL{2,2} = @(Phi,X) Beta_coupled(2,1)*abs(Phi{2}).^2 +Beta_coupled(2,2)*abs(Phi{1}).^2;

Physics1D = Physics1D_Var1d(Method, Delta, Beta);
Physics1D = Dispersion_Var1d(Method, Physics1D);

pol=cell(2);
pol{1,1} = @(y) 0.003*y.^2;
pol{2,2} = @(y) 0.01*y.^2;

Physics1D = Potential_Var1d(Method, Physics1D, pol);
Physics1D = Nonlinearity_Var1d(Method, Physics1D,Coupled_NL);

%% Setting the initial data
InitialData_Choice = 1;
Phi_0 = InitialData_Var1d(Method, Geometry1D, Physics1D, InitialData_Choice);

%% Setting informations and outputs
Outputs = OutputsINI_Var1d(Method);
Printing = 1;
Evo = 15;
Draw = 1;
Print = Print_Var1d(Printing,Evo,Draw);

%-----------------------------------------------------------
% Launching simulation
%-----------------------------------------------------------

[Phi, Outputs] = GPELab1d(Phi_0,Method,Geometry1D,Physics1D,Outputs,[],Print);