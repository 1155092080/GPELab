%%% This file is for simulate Rb Na system with LHY correction, espetially
%%% for Droplet system

%% 0. Initialize running for getting 
clear;
NNa = 65262/1.4;
NRb = 65262;
a12bar = -59.7908;
gNa = 0;
gRb = 0;
CharaLength = 1.6E-6;
LHY_Q =1;
data_0 = SetData0(NRb, NNa, a12bar, gNa, gRb, LHY_Q, CharaLength);
data = RunGPE(data_0);
save(['NNa' num2str(NNa) 'NRb' num2str(NRb) 'a12' num2str(a12bar)  '.mat'],'data');

%% 1. loop running for simulation
for i = 0:2
    NNa = 10000;
    a12bar = -79-2*i;
    gNa=0;
    data_0 = ReSetData(data, NNa, gNa, a12bar);
    data = RunGPE(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) '.mat'],'data');
end
