function [CoupledEnergy] = Coupled_energy_withLHY_3D(Beta, Gamma)

CoupledEnergy = cell(2);
CoupledEnergy{1,1} = @(Phi,X,Y,Z)(1/2)*Beta(1,1)*abs(Phi{1}).^2+(1/2)*Beta(1,2)*abs(Phi{2}).^2 + ;
CoupledEnergy{2,2} = @(Phi,X,Y,Z)(1/2)*Beta(2,2)*abs(Phi{2}).^2+(1/2)*Beta(2,1)*abs(Phi{1}).^2 + ;
CoupledEnergy{1,2} = @(Phi,X,Y,Z) 0;
CoupledEnergy{2,1} = @(Phi,X,Y,Z) 0;

end