%% test release energy
clear;
%Blist = [350.45077,350.21925,350.12664,350.03403,349.98773,349.94143,349.91827,349.89512];
%a12list = 76.33*(1-4.255./(Blist-347.648));
%NNalist = [99764.46688,100069.09096,65254.82078,61286.69312,68356.71794,43269.12249,37090.37838,14764.91198];
%NRblist = [110182.63059,85280.02915,85468.27006,65262.84152,57344.90925,47884.39399,34775.39011,29531.41512];
%halfsize = [10,10,10,6,6,6,6,6];

Blist = 349.8:0.1:350.6;  %350.6G to 349.8
a12list = 76.33*(1-4.255./(Blist-347.648));
NNalist = 10.^(4:0.3:5.5);
NRblist = NNalist*1.43;
halfsize = 6:0.5:10;

for i = 1:length(Blist)  % loop of B
        a12bar = a12list(i);
        NNa = NNalist(1);
        NRb = NRblist(1);   
        gNa = 0;gRb = 0;
        CharaLength = 1.6E-6;
        LHY_Q = 1;
        data_0 = SetData0(NRb, NNa, a12bar, gNa, gRb, LHY_Q, CharaLength, halfsize(i));
        data = RunGPE(data_0);
        save([num2str(LHY_Q) 'LHYQ' '-NNa' num2str(NNa) '-NRb' num2str(NRb) '-a12' num2str(a12bar)  '.mat'],'data');
    
    for j = 2:length(NNalist)  % loop of number
        NNa = NNalist(j);
        NRb = NRblist(j);   
        data_0 = SetData0(NRb, NNa, a12bar, gNa, gRb, LHY_Q, CharaLength, halfsize(i));
        data_0.Phi = data.Phi;
        data = RunGPE(data_0);
        save([num2str(LHY_Q) 'LHYQ' '-NNa' num2str(NNa) '-NRb' num2str(NRb) '-a12' num2str(a12bar)  '.mat'],'data');
    end
end