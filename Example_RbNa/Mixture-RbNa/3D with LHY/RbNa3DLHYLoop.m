%% 1. Loop 
for i = 1:95
    NNa = 98000 - 1000*i;
    a12bar = -70;
    data_0 = ReSetData(data, NNa);
    data = Run(data_0);
    save(['NNa' num2str(NNa) 'a12' num2str(a12bar) '.mat'],'data');
end