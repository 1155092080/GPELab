%% Draw wave functions' square of the modulus and angle
%% INPUTS:
%%          Phi: Wave functions (cell array)
%%          Method: Structure containing variables concerning the method (structure) (see Method_Var3d.m)
%%          Geometry3D: Structure containing variables concerning the geometry of the problem in 3D (structure) (see Geometry3D_Var3d.m)
%%          Figure: Structure containing variables concerning the figures (structure) (see Figure_Var3d.m)
%% FUNCTIONS USED:
%%          draw_isosurface_3d: To draw the wave function's square modulus and angle isosurface (line 19 and 23)

function Draw_solution3d(FFTPhi, Method, FFTGeometry3D, Figure)
%% FOR each component drawing the isosurface of modular of wavefunction and phase of them
for n = 1:Method.Ncomponents
    %% Printing the figure of the square of the modulus of wave function
    Figure.label = n; % Number of the figure
    Figure.title = strcat('|\phi(x,y,z)|^2 of component ', 32, num2str(n)); % Storing title of the figure
    %Draw_projection_3d(Phi,Method,Geometry3D,Figure)
    draw_isosurface_3d(abs(FFTPhi{n}).^2,FFTGeometry3D,Figure); % Drawing the square of the modulus of the wave function
    %% Printing the figure of the angle of wave function
    Figure.label = n+Method.Ncomponents; % Number of the figure
    Figure.title = strcat('angle(\phi(x,y,z)) of component ', 32 ,num2str(n)); % Storing title of the figure
    draw_slice_3d(angle(FFTPhi{n}),FFTGeometry3D,Figure); % Drawing the angle of the wave function
    %% Printing the projection of the wave function onto XY plane
    Figure.label = n+2*Method.Ncomponents; % Number of the figure
    Figure.title = strcat('|\phi(x,y,.)|^2 of component ', 32, num2str(n)); % Storing title of the figure
    draw1projection_3d(FFTPhi{n},FFTGeometry3D,Figure); % Drawing the projection of the figures
    %% Printing the projection of the wave function onto X axis
    Figure.label = n+3*Method.Ncomponents; % Number of the figure
    Figure.title = strcat('|\phi(x,.,.)|^2 of component ', 32, num2str(n)); % Storing title of the figure
    draw1projectionAxis_3d(FFTPhi{n},FFTGeometry3D,Figure); % Drawing the projection of the figures
end

%% Drawing isosurface of all components
if (Method.Ncomponents>1)
    Figure.label = 1+4*Method.Ncomponents; % Number of the figure
    Figure.title = strcat('|\phi(x,y,z)|^2 of all components'); % Storing title of the figure
    %% Printing the figure of the square of the modulus of all wave functions
    draw_allisosurfaces_3d(FFTPhi,Method,FFTGeometry3D,Figure); % Drawing the square of the modulus of all wave functions
end