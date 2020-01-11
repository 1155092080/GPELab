%%% This file is for simulate Rb Na system with LHY correction, espetially
%%% for Droplet system

%% 0. Initialize running for getting 
clear;
NNa = 4300;
a12bar = -70;
gNa = 0;
data_0 = SetData0(NNa, a12bar, gNa);
data = RunGPE(data_0);
save(['NNa' num2str(NNa) 'a12' num2str(a12bar)  '.mat'],'data');

%% 1. loop running for simulation
for i = 0:5
    NNa = 4500 - 100*i;
    a12bar = -70;
    data_0 = ReSetData(data, NNa, gNa);
    data = RunGPE(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) '.mat'],'data');
end
