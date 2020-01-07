%% This function is for initializing "data_0"
%% Input:
%%
%% Output:
%%  data_0: is a structure evolving all parameters for run function
function [ data_0 ] = SetData0()
%% Set Constants, which including all physics parameters
data_0.Constants = SetConstantRbNa();

%% Set method
deltat = 1E-3;
energy_crit = 1E-2;
data_0.Method = SetMethodRbNa(deltat, energy_crit);

%% Set Geometry
halfsize = 4.5;
gridIndex = 5;
data_0.Geometry3D = SetGeometryRbNa(halfsize, gridIndex);

%%
end

