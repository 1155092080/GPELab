%%% This file is a test for calculating Rb BEC in 1D harmonic trap

%% GROUND STATE COMPUTATION FOR RB BEC IN 1D HARMONIC TRAP

%% -----------------------------------------------------------
% Setting the data


%%-----------------------------------------------------------

%% Setting the method and geometry
Computation = 'Ground';
Ncomponents = 1;
Type = 'BESP';
Deltat = 1e-3;
Stop_time = [];
Stop_crit = {'Energy',1e-6};
Method = Method_Var1d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);
xmin = -16;
xmax = 16;
Nx = 2^10+1;
Geometry1D = Geometry1D_Var1d(xmin,xmax,Nx);

%% Setting the physical problem
Delta = 0.5;
Beta = 1;
Beta_11=con.Beta_11;
Beta_22=con.Beta_22;
Beta_12=con.Beta_12;
Beta_21=con.Beta_21;
Physics3D = Physics3D_Var3d(Method, Delta, Beta);
Physics3D = Dispersion_Var3d(Method, Physics3D,[],dispersion3D);
Physics3D = Potential_Var3d(Method, Physics3D, con.potential);
Physics3D = Nonlinearity_Var3d(Method, Physics3D, Nonlinearity3D(Beta_11,Beta_22,Beta_12,Beta_21),[],Nonlinearity3D_Energy(Beta_11,Beta_22,Beta_12,Beta_21));
