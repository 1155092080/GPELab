%% This function is for retrun grid size of a given mesh
%% Input:
%%  Geometry3D: which defined in the GPELAB by the function "Geometry3D_Var3D"
%% Output:
%%  vol: which is just the grid size of the mesh
function [ vol ] = GridVol( Geometry3D )
    %% Directly return the vol    
    vol = Geometry3D.dx * Geometry3D.dy * Geometry3D.dz; 
end

