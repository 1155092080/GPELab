%% Function for plot Isosurface 3D
%% Input:
%%  data: 'data' of simulation
%%  component: '1', '2' ... or 'All'
%% Output:
%%  draw on existing figure, without creating new figure

function [] = PlotIsosurface3D( data, component )

switch component
    case 'All'
        %%plot all components
        Colors = {'blue','red','green','yellow','magenta'};
        % FOR each component
        for n = 1:data.Method.Ncomponents
            hpatch = patch(isosurface(data.Geometry3D.X,data.Geometry3D.Y,data.Geometry3D.Z,abs(data.Phi{n}).^2,data.Figure.iso)); % Computing the patch
            isonormals(data.Geometry3D.X,data.Geometry3D.Y,data.Geometry3D.Z,abs(data.Phi{n}).^2,hpatch); % Computing the isosnormal
            set(hpatch,'facecolor',Colors{n},'edgecolor','none'); % Setting the color of faces and edges
        end
        
    otherwise
        %%plot one component
        hpatch = patch(isosurface(data.Geometry3D.X, data.Geometry3D.Y, data.Geometry3D.Z, data.Phi{str2num(component)}, data.Figure.iso)); % Computing the patch
        isonormals(data.Geometry3D.X, data.Geometry3D.Y, data.Geometry3D.Z, data.Phi{str2num(component)}, hpatch); % Computing the isonormal
        set(hpatch,'facecolor',data.Figure.color,'edgecolor','none'); % Setting the color of faces and edges
end
        daspect(data.Figure.aspect); % Setting the data aspect ratio
        view(data.Figure.view); % Setting the angle of view
        axis tight; % Setting the axis limits to the range of the data
        grid on; % Adding major grid lines
        camlight; % Setting light
        axis equal; % Setting the aspect ratio so that increments on the x,y,z axis are of equal size
        
        xlabel(data.Figure.x); % Adding text beside the x-axis
        xlabel(data.Figure.y); % Adding text beside the y-axis
        xlabel(data.Figure.z); % Adding text beside the z-axis
        lighting gouraud; % Setting the lighting to gouraud
        alpha(data.Figure.alpha); % Setting transparency
        drawnow;

end

