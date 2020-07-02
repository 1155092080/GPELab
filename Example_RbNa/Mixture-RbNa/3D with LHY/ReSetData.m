%% This function is for reset "data"
%% Input:
%%
%% Output:
%%  data_0: is a structure evolving all parameters for run function
function [ data_0 ] = ReSetData( data, NNa, gNa )
%% Set Constants, which including all physics parameters
data_0.Constants = data.Constants;
%% Set Rb Na number
NRb = NNa*1.43251;
data_0.Number = SetNumberRbNa(NNa, NRb);
%% Set method
deltat = 1E-1;
energy_crit = 1E-10;
data_0.Method = SetMethodRbNa(deltat, energy_crit);

%% Set Geometry
data_0.Geometry3D = data.Geometry3D;
%% Set Geometry
%halfsize = 7;
%gridIndex = 5;
%data_0.Geometry3D = SetGeometryRbNa(halfsize, gridIndex);

%% Set Characteristic parameter
data_0.Character = data.Character;
%% Set Physics
data_0.Physics3D = SetPhysicsRbNa(data_0.Constants, data_0.Character, data_0.Number, gNa, data_0.Method);
%% Set Phi_0
data_0.Phi = data.Phi;
%% Set Outputs, Print and Figure
data_0.Outputs = data.Outputs;
data_0.Print = data.Print;
data_0.Figure = data.Figure;
end

