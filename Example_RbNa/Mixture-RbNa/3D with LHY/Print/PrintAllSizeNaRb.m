clear;
matPath = 'C:\Users\Administrator.WIN-KQNL4VO8QRH\Documents\GitHub\GPELab\Example_RbNa\Mixture-RbNa\3D with LHY\';
matDIR = dir([matPath '*.mat']);
l = length(matDIR);

a12 = zeros(l,1);
NNa = zeros(l,1);
NRb = zeros(l,1);
sizeNa = zeros(l,1);
sizeRb = zeros(l,1);

for i = 1:l
    tempdata = load([matPath matDIR(i).name]);
    a12(i) = tempdata.data.Constants.a12/tempdata.data.Constants.a0;
    NNa(i) = tempdata.data.Number.Na;
    NRb(i) = tempdata.data.Number.Rb;
    sizeNa(i) = (tempdata.data.Outputs.x_rms{1}(end)* ...
               tempdata.data.Outputs.y_rms{1}(end)* ...
               tempdata.data.Outputs.z_rms{1}(end) ...
               )^(1/3);
    sizeRb(i) = (tempdata.data.Outputs.x_rms{2}(end)* ...
               tempdata.data.Outputs.y_rms{2}(end)* ...
               tempdata.data.Outputs.z_rms{2}(end)  ...
               )^(1/3);
end

%[a12_sorted, a12_order] = sort(a12);
%Energy_release = Energy_release(a12_order);

%figure
%plot(a12_sorted, Energy_release);


assem = [a12,NNa,NRb,sizeNa,sizeRb];
writematrix(assem,"size.txt");