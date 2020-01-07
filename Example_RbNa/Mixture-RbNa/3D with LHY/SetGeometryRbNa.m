%% Function for setting Geometry of Rb Na system
%% Input:
%%  halfsize: define half of simulation size which is in unit of abar
%%  gridIndex: define how many grid you need(grid = 2^gridIndex + 1)
%% Output:
%%  Geometry3D: define the Geometry of simulation
function [ Geometry3D ] = SetGeometryRbNa(halfsize, gridIndex)
%% Setting Geometry
xmin = -halfsize;
xmax = halfsize;
ymin = -halfsize;
ymax = halfsize;
zmin = -halfsize;
zmax = halfsize;
Nx = 2^gridIndex+1;
Ny = 2^gridIndex+1;
Nz = 2^gridIndex+1;
Geometry3D = Geometry3D_Var3d(xmin,xmax,ymin,ymax,zmin,zmax,Nx,Ny,Nz);
end

