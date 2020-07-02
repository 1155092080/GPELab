%% Function for plotting integraion onto one plane
%% Input:
%%  data: 'data' of simulation
%%  component: '1', '2' ... or 'All'
%%  plane: 'XY', 'YZ' or 'ZX'
%% Output:
%%  draw on existing figure, without creating new figure

function [] = PlotProjection( data, component, plane )
switch plane
    case 'XY'
        Phi_proj = data.Geometry3D.dz * squeeze(sum(abs(data.Phi{str2num(component)}).^2,3));
        surf(data.Geometry3D.X(:,:,1), data.Geometry3D.Y(:,:,1),Phi_proj,'EdgeColor','none'); % Drawing function
        shading interp; % Setting shading
        colormap(data.Figure.map); % Setting colormap
        colorbar; % Setting colorbar
        view([0 0 1]); % Setting view
        xlabel(data.Figure.x); % Setting x-axis label
        ylabel(data.Figure.y); % Setting y-axis label
        drawnow; % Drawing
    case 'YZ'
        Phi_proj = data.Geometry3D.dx * squeeze(sum(abs(data.Phi{str2num(component)}).^2,2));
        surf(squeeze(data.Geometry3D.Y(:,1,:)), squeeze(data.Geometry3D.Z(:,1,:)),Phi_proj,'EdgeColor','none'); % Drawing function
        shading interp; % Setting shading
        colormap(data.Figure.map); % Setting colormap
        colorbar; % Setting colorbar
        view([0 0 1]); % Setting view
        xlabel(data.Figure.y); % Setting x-axis label
        ylabel(data.Figure.z); % Setting y-axis label
        drawnow; % Drawing
    case 'ZX'
        Phi_proj = data.Geometry3D.dy * squeeze(sum(abs(data.Phi{str2num(component)}).^2,1));
        surf(squeeze(data.Geometry3D.Z(1,:,:)), squeeze(data.Geometry3D.X(1,:,:)),Phi_proj,'EdgeColor','none'); % Drawing function
        shading interp; % Setting shading
        colormap(data.Figure.map); % Setting colormap
        colorbar; % Setting colorbar
        view([0 0 1]); % Setting view
        xlabel(data.Figure.z); % Setting x-axis label
        ylabel(data.Figure.x); % Setting y-axis label
        drawnow; % Drawing
end
end

