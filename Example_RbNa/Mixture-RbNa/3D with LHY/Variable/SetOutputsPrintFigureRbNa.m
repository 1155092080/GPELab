%% Set Print and Figure choice for simulation
%% Input:
%%
%% Output:
%%  
function [ Outputs, Print, Figure ] = SetOutputsPrintFigureRbNa(Method)
%% Setting outputs
sav = 1;
Outputs = OutputsINI_Var3d(Method, sav);

%% Setting Printing
Printing = 1;
Evo = 100;
Draw = 1;
Print = Print_Var3d(Printing,Evo,Draw);

% set Figure parameters
View = 3;
Isovalue = 1e-2;
Alpha = 0.4;
Map = 'jet';
Figure = Figure_Var3d(View,Isovalue,Alpha,'map',Map);
end

