%% function for implementing single shot of simulation
%% Input:
%%  data_0: which contains all initial 
%% Output:
%%  data: which contains all parameters after simulation
function [data] = Run(data_0)
    %% data inherits parameters from data_0
    data.Constants = data_0.Constants;
    data.Method = data_0.Method;
    data.Geometry3D = data_0.Geometry3D;
    data.Physics3D = data_0.Physics3D;
    data.Print = data_0.Print;
    data.Figure = data_0.Figure;
    
    %% do simulation by GPELAB and generate new Phi and Outputs
    [data.Phi, data.Outputs] = GPELab3d(data_0.Phi, data_0.Method,...
        data_0.Geometry3D, data_0.Physics3D, data_0.Outputs,...
        [], data_0.Print, data_0.Figure);
    
    %% Plot Energy evolution to check its convergnence
    PlotEvolution(data.Outputs,'Energy');
end

