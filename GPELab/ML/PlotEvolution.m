%% This function is for checking energy evoloution throught the whole simuation
%% Input:
%%  Outputs: Which is generated from the GPELAB simulation, evolving information of each step of evolution
%%  item:    the parameter you want to see
%%      1. phi_abs_0
%%      2. x_rms(y_rms or z_rms)
%%      3. Energy
%%      4. Chemical_potential
%%      5. Angular_momentum
%%      6. iteration_vec
%% Output:
%%  Figure about energy evolution
function PlotEvolution( Outputs, item)

%% create figure for plotting
figure('Name',item);

%% get number of components
Ncom = length(Outputs.(item));

%% set temp for saving total energy
temp = 0;

%% plot each component
for i = 1:Ncom
    plot(1:Outputs.Iterations,Outputs.(item){i});
    %temp = temp + Outputs.(item){i};
    hold on;
end

%% plot total energy
%plot(1:Outputs.Iterations,temp);

end

