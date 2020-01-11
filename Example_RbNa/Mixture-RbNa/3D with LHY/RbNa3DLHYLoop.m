%% 1. Loop seperately 

for i = 0:0
    NNa = 4300;
    a12bar = -70;
    gNa = 0.1*i;
    data_0 = ReSetData(data, NNa, gNa);
    data = RunGPE(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) 'Grad' num2str(gNa) '.mat'],'data');
end