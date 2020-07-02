%% This function is for set initial wave function of Rb Na system
%% Input:
%%  Method, Geometry3D and Physics3D
%% Output:
%%  Phi_0: which is initialized by gaussian function in harmonic trap

function [ Phi_0 ] = SetPhi0RbNa( Method, Geometry3D, Physics3D )
%% Setting the initial data
InitialData_Choice = 1;
%PsPhysics3D = Physics3D;
%PsPhysics3D.omega = 2*pi*[100 100 100];
Phi_0 = InitialData_Var3d(Method, Geometry3D, Physics3D, InitialData_Choice);
end

