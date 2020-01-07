%% function for Set method in the Rb Na GPE simulation
%% Input:
%%  deltat: step length of evolution
%%  energy_crit: define the stop crit
%% Output:
%%  Method: which involves simulation method

function [ Method ] = SetMethodRbNa(deltat, energy_crit)

Computation = 'Ground';
Ncomponents = 2;
Type = 'BESP';
Deltat = deltat;
Stop_time = [];
Stop_crit = {'Energy',energy_crit};
Method = Method_Var3d(Computation, Ncomponents, Type, Deltat, Stop_time, Stop_crit);

end

