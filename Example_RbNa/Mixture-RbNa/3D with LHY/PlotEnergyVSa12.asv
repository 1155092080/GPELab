matPath = 'C:\Users\Administrator.WIN-KQNL4VO8QRH\Documents\GitHub\GPELab\Example_RbNa\Mixture-RbNa\3D with LHY\LHYLiquid_Try2.0\';
matDIR = dir([matPath '*.mat']);
l = length(matDIR);

a12 = zeros(l);
Energy1 = zeros(l);
Energy2 = zeros(l);
EnergyTot = zeros(l);
sigx1 = zeros(l);
sigx2 = zeros(l);

for i = 1:l
    tempdata = load([matPath matDIR(i).name]);
    a12(i) = tempdata.data.Constants.a12/tempdata.data.Constants.a0;
    Energy1(i) = tempdata.data.Outputs.Energy{1}(end);
    Energy2(i) = tempdata.data.Outputs.Energy{2}(end);
    sigx1(i) = tempdata.data.Outputs.x_rms{1}(end);
    sigx2(i) = tempdata.data.Outputs.x_rms{2}(end);
    EnergyTot = (1/(tempdata.data.Number.Na + tempdata.data.Number.Rb))* ...
        (Energy1 * tempdata.data.Number.Na + Energy2 * tempdata.data.Number.Rb);
    
end

[a12_sorted, a12_order] = sort(a12);
Energy1 = Energy1(a12_order);
Energy2 = Energy2(a12_order);
EnergyTot = EnergyTot(a12_order);
sigx1 = sigx1(a12_order);
sigx2 = sigx2(a12_order);

figure
plot(a12_sorted, Energy1, a12_sorted, Energy2, a12_sorted, EnergyTot);
hold on;
%% plot size
plot(a12_sorted, sigx1, a12_sorted, sigx2)