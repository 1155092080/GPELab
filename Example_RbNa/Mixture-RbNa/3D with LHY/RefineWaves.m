%% This function is for refine wavefunctions in 'data'
%% Input:
%%  data: where stores original wavefunctions
%% Output:
%%  data: where stores refined wavefunctions

function [ data ] = RefineWaves( data )
for i = 1:data.Method.Ncomponents
    data.Phi{i} = RefineWavefunction(data.Phi{i});
end

data.Geometry3D = Geometry3D_Var3d(-data.Geometry3D.Lx/2,data.Geometry3D.Lx/2,...
    -data.Geometry3D.Ly/2,data.Geometry3D.Ly/2,-data.Geometry3D.Lz/2,...
    data.Geometry3D.Lz/2,data.Geometry3D.Nx*2-1,data.Geometry3D.Ny*2-1,...
    data.Geometry3D.Nz*2-1);
end

