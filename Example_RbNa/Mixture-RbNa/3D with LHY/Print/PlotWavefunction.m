%% This function is for plotting wavefunction of "data"
%% Inputs:
%%  
%% Outputs:
%%  Figure_1:
%%      Isosurface_3D, slicePhase_3D, AxisPlot(X,Y,Z) and ProjectionPlot(YZ, ZX, XY)
%%  Figure_2:
%%      Isosurface_3D of all components

function [] = PlotWavefunction( data )
%% Create figure A
scrsz = get(groot,'ScreenSize');
width =  scrsz(3)*2/3;
figure('OuterPosition',[1 1 width scrsz(4)]);
%% create subplot for each plot
%% 3D plot
%Angle#1
subplot(4,4,1);
PlotSlice3D(data, '1');
title('angle(\phi(x,y,z)) of component 1');
%Angle#2
subplot(4,4,5);
PlotSlice3D(data, '2');
title('angle(\phi(x,y,z)) of component 2');

%Isosurface 1
subplot(4,4,2);
PlotIsosurface3D(data, '1');
title('|\phi(x,y,z)|^2 of component 1');
%Isosurface 2
subplot(4,4,6);
PlotIsosurface3D(data, '2');
title('|\phi(x,y,z)|^2 of component 2');

%% projection
%X-Y projection 1
subplot(4,4,3);
PlotProjection(data, '1', 'XY');
title('projection X-Y of |\phi(x,y,z)|^2 of component 1');
%X-Y projection 2
subplot(4,4,7);
PlotProjection(data, '2', 'XY');
title('projection X-Y of |\phi(x,y,z)|^2 of component 2');

%Y-Z projection 1
subplot(4,4,9);
PlotProjection(data, '1', 'YZ');
title('projection Y-Z of |\phi(x,y,z)|^2 of component 1');
%Y-Z projection 2
subplot(4,4,13);
PlotProjection(data, '2', 'YZ');
title('projection Y-Z of |\phi(x,y,z)|^2 of component 2');

%Z-X projection 1
subplot(4,4,11);
PlotProjection(data, '1', 'ZX');
title('projection Z-X of |\phi(x,y,z)|^2 of component 1');
%Z-X projection 2
subplot(4,4,15);
PlotProjection(data, '2', 'ZX');
title('projection Z-X of |\phi(x,y,z)|^2 of component 2');

%% Axis plot
%Z Axis 1
subplot(4,4,4);
PlotAxis(data, '1', 'Z');
title('Axis Z of |\phi(x,y,z)|^2 of component 1');
%Z Axis 2
subplot(4,4,8);
PlotAxis(data, '2', 'Z');
title('Axis Z of |\phi(x,y,z)|^2 of component 2');

%X Axis 1
subplot(4,4,10);
PlotAxis(data, '1', 'X');
title('Axis X of |\phi(x,y,z)|^2 of component 1');
%X Axis 2
subplot(4,4,14);
PlotAxis(data, '2', 'X');
title('Axis X of |\phi(x,y,z)|^2 of component 2');

%Y Axis 1
subplot(4,4,12);
PlotAxis(data, '1', 'Y');
title('Axis Y of |\phi(x,y,z)|^2 of component 1');
%X Axis 2
subplot(4,4,16);
PlotAxis(data, '2', 'Y');
title('Axis Y of |\phi(x,y,z)|^2 of component 2');

%% create Figure B
figure('OuterPosition',[scrsz(3)-scrsz(4)/2 scrsz(4)/2 scrsz(4)/2 scrsz(4)/2]);
PlotIsosurface3D(data, 'All');
title('|\phi(x,y,z)|^2 of all components');

end

