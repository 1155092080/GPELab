function [CoupledCubicNonlinearity] = Coupled_Cubic1D(Beta)

CoupledCubicNonlinearity = cell(2);
CoupledCubicNonlinearity{1,1} = @(Phi,X)Beta(1,1)*abs(Phi{1}).^2 + Beta(1,2)*abs(Phi{2}).^2;
CoupledCubicNonlinearity{2,2} = @(Phi,X)Beta(2,2)*abs(Phi{2}).^2 + Beta(2,1)*abs(Phi{1}).^2;
CoupledCubicNonlinearity{1,2} = @(Phi,X) 0;
CoupledCubicNonlinearity{2,1} = @(Phi,X) 0;