%% This function is for initializing "data_0"
%% Input:
%%  NNa: Na number
%%  a12bar: a12 = a12bar*a0 define the Rb-Na interaction strength
%% Output:
%%  data_0: is a structure evolving all parameters for run function
function [ data_0 ] = SetData0(NRb, NNa, a12bar, gNa, gRb, LHY_Q, CharaLength, halfsize)
%% Set Constants, which including all physics parameters
data_0.Constants = SetConstantRbNa(a12bar);

%% Set Rb Na number
data_0.Number = SetNumberRbNa(NNa, NRb);

%% Set method
deltat = 3E-3;
energy_crit = 3E-4;
data_0.Method = SetMethodRbNa(deltat, energy_crit);

%% Set Geometry
%halfsize = 5;
gridIndex = 5;
data_0.Geometry3D = SetGeometryRbNa(halfsize, gridIndex);

%% Set Characteristic parameter
data_0.Character = SetCharacterRbNa(data_0.Constants, CharaLength);

%% Set Physics
data_0.Physics3D = SetPhysicsRbNa(data_0.Constants, data_0.Character, data_0.Number, gNa, gRb, LHY_Q, data_0.Method);

%% Set Phi_0
data_0.Phi = SetPhi0RbNa( data_0.Method, data_0.Geometry3D, data_0.Physics3D );

%% Set Outputs, Print and Figure
[data_0.Outputs, data_0.Print, data_0.Figure] = SetOutputsPrintFigureRbNa(data_0.Method);

end

