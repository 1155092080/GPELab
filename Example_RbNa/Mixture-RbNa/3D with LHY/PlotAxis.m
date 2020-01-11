%% Function for plotting wavefunction on one axis
%% Input:
%%  data: 'data' of simulation
%%  component: '1', '2' ... or 'All'
%%  axis: 'X', 'Y' or 'Z'
%% Output:
%%  draw on existing figure, without creating new figure

function [] = PlotAxis( data, component, axis )
switch axis
    case 'X'       
        Cy = floor(data.Geometry3D.Ny / 2) + 1; % get the center of y
        Cz = floor(data.Geometry3D.Nz / 2) + 1; % get the center of z
        Phi_axis = abs(data.Phi{str2num(component)}(Cy,:,Cz)).^2;
        line(squeeze(data.Geometry3D.X(1,:,1)),Phi_axis); % Drawing function
        xlabel(data.Figure.x); % Setting x-axis label
        drawnow; % Drawing
    case 'Y'
        Cz = floor(data.Geometry3D.Nz / 2) + 1; % get the center of z
        Cx = floor(data.Geometry3D.Nx / 2) + 1; % get the center of y
        Phi_axis = abs(squeeze(data.Phi{str2num(component)}(:,Cx,Cz))).^2;
        line(squeeze(data.Geometry3D.Y(:,1,1)),Phi_axis); % Drawing function
        xlabel(data.Figure.y); % Setting x-axis label
        drawnow; % Drawing
    case 'Z'
        Cx = floor(data.Geometry3D.Nx / 2) + 1; % get the center of z
        Cy = floor(data.Geometry3D.Ny / 2) + 1; % get the center of y
        Phi_axis = abs(squeeze(data.Phi{str2num(component)}(Cx,Cy,:))).^2;
        line(squeeze(data.Geometry3D.Z(1,1,:)),Phi_axis); % Drawing function
        xlabel(data.Figure.z); % Setting x-axis label
        drawnow; % Drawing
end
end

