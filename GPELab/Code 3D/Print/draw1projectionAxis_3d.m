%% Draw one wave function's projection on the x,y plane
%% INPUTS:
%%          phi: Wave function (matrix)
%%          Method: Structure containing variables concerning the method (structure)
%%          Geometry3D: Structure containing variables concerning the geometry of the problem in 3D (structure) (see Geometry3D_Var3d.m)
%%          Figure: Structure containing variables concerning the figures (structure)

function draw1projectionAxis_3d(phi,Geometry3D,Figure)
figure(Figure.label); % Number of the figure
clf(Figure.label); % Clear the figure
Cz = floor(Geometry3D.Nz / 2) + 1; % get the center of z
Cy = floor(Geometry3D.Ny / 2) + 1; % get the center of y
Phi_X = sqrt(abs(phi(:,Cy,Cz)).^2);
line(Geometry3D.X(1,:,1),Phi_X); % Drawing function
xlabel(Figure.x); % Setting x-axis label
title(Figure.title);
drawnow; % Drawing