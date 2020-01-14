%% 1. Loop seperately 

for i = 0:0
    NNa = 3500 - 10*i;
    a12bar = -70;
    gNa = 0;
    data_0 = ReSetData(data, NNa, gNa);
    data = RunGPE(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) 'Grad' num2str(gNa) '.mat'],'data');
end