%% This function is for setting physics of Rb Na system
%% Input:
%%
%% Output:
%%  Physics3D:

function [ Physics3D ] = SetPhysicsRbNa(Constants, Character, Number, gNa, gRb, LHY_Q, Method)
%% Setting the physical problem
Delta = 0.5;
Beta = 1;
Physics3D = Physics3D_Var3d(Method, Delta, Beta);

%% Set Dispersion by SetDispersionRbNa function;
Physics3D = Dispersion_Var3d(Method, Physics3D, [], SetDispersionRbNa());

%% Set outside potential by SetPotentialRbNa function
Physics3D = Potential_Var3d(Method, Physics3D, SetPotentialRbNa(Constants, Character, Number, gNa, gRb));

%% Set interaction of Rb Na system by SetInteractionwLHYRbNa function
Physics3D = Nonlinearity_Var3d(Method, Physics3D, SetInteractionwLHYRbNa(Constants, Character, Number, LHY_Q));

end

