%%% This file is for simulate Rb Na system with LHY correction, espetially
%%% for Droplet system

%% 0. Initialize running for getting 
clear;
NNa = 110182/1.43;
NRb = 110182;
a12bar = -39.55;
%a12bar = 0;
gNa = 0;
gRb = 0;
CharaLength = 1.2E-6;
LHY_Q =0;
halfsize = 10;
data_0 = SetData0(NRb, NNa, a12bar, gNa, gRb, LHY_Q, CharaLength, halfsize);
data = RunGPE(data_0);
save(['LHY_Q' num2str(LHY_Q) 'NNa' num2str(NNa) 'NRb' num2str(NRb) 'a12' num2str(a12bar)  '.mat'],'data');

%% 1. loop running for simulation
for i = 0:2
    NNa = 10000;
    a12bar = -79-2*i;
    gNa=0;
    data_0 = ReSetData(data, NNa, gNa, a12bar);
    data = RunGPE(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) '.mat'],'data');
end
