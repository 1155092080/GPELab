%% Draw one wave function's projection on the x,y plane
%% INPUTS:
%%          phi: Wave function (matrix)
%%          Method: Structure containing variables concerning the method (structure)
%%          Geometry3D: Structure containing variables concerning the geometry of the problem in 3D (structure) (see Geometry3D_Var3d.m)
%%          Figure: Structure containing variables concerning the figures (structure)

function draw1projection_3d(phi,Geometry3D,Figure)
figure(Figure.label); % Number of the figure
clf(Figure.label); % Clear the figure
Phi_projz = sqrt(Geometry3D.dz)*sqrt(sum(abs(phi).^2,3));
surf(Geometry3D.X(:,:,1),Geometry3D.Y(:,:,1),Phi_projz,'EdgeColor','none'); % Drawing function
shading interp; % Setting shading
colormap(Figure.map); % Setting colormap
colorbar; % Setting colorbar
view([0 5 0]); % Setting view
xlabel(Figure.x); % Setting x-axis label
ylabel(Figure.y); % Setting y-axis label
title(Figure.title);
drawnow; % Drawing