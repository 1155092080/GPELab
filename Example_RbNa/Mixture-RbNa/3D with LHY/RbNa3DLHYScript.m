%%% This file is for simulate Rb Na system with LHY correction, espetially
%%% for Droplet system

%% 0. Initialize running for getting 
clear all;
NNa = 100000;
a12bar = -70;
data_0 = SetData0(NNa, a12bar);
data = Run(data_0);
save(['NNa' num2str(NNa) 'a12' num2str(a12bar) '.mat'],'data');


