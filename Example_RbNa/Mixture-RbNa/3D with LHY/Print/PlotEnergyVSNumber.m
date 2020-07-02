matPath = 'C:\Users\Administrator.WIN-KQNL4VO8QRH\Documents\GitHub\GPELab\Example_RbNa\Mixture-RbNa\3D with LHY\LHYLiquid_Try2.0\';
matDIR = dir([matPath '*.mat']);
l = length(matDIR);

Num = zeros(l);
Energy1 = zeros(l);
Energy2 = zeros(l);
EnergyTot = zeros(l);
sigx1 = zeros(l);
sigx2 = zeros(l);

for i = 1:l
    tempdata = load([matPath matDIR(i).name]);
    Num(i) = tempdata.data.Number.Na;
    Energy1(i) = tempdata.data.Outputs.Energy{1}(end);
    Energy2(i) = tempdata.data.Outputs.Energy{2}(end);
    sigx1(i) = tempdata.data.Outputs.x_rms{1}(end);
    sigx2(i) = tempdata.data.Outputs.x_rms{2}(end);
    EnergyTot = (1/(tempdata.data.Number.Na + tempdata.data.Number.Rb))* ...
        (Energy1 * tempdata.data.Number.Na + Energy2 * tempdata.data.Number.Rb);
    
end

[Num_sorted, Num_order] = sort(Num);
Energy1 = Energy1(Num_order);
Energy2 = Energy2(Num_order);
EnergyTot = EnergyTot(Num_order);
sigx1 = sigx1(Num_order);
sigx2 = sigx2(Num_order);

figure
plot(Num_sorted, Energy1, Num_sorted, Energy2, Num_sorted, EnergyTot);
hold on;
plot(Num_sorted, sigx1, Num_sorted, sigx2)