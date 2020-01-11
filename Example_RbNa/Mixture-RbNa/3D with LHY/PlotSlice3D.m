%% This function is for plot phase(angle) of wavefunction
%% Input:
%%  
%% Output:
%%  plot only on existing figure without creating new graph

function [] = PlotSlice3D( data, component )

slice(data.Geometry3D.X,data.Geometry3D.Y,data.Geometry3D.Z,angle(data.Phi{str2num(component)}),data.Figure.Sy,data.Figure.Sx,data.Figure.Sz); % Computing the slice
shading interp; % Setting shading
colormap(data.Figure.map); % Setting the colormap
colorbar; % Adding the colorbar
xlabel(data.Figure.x); % Setting x-axis label
ylabel(data.Figure.y); % Setting y-axis label
drawnow;

end

