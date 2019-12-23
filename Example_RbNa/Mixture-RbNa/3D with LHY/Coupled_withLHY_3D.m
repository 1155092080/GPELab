function [ CoupledCubicNonlinearity ] = Coupled_withLHY_3D( Beta, Gamma, Etta)
%% Definition of Beta, Gamma and Etta, please ref to the mathematica note: "Note_GPELAB_Droplet"

CoupledCubicNonlinearity = cell(2);
CoupledCubicNonlinearity{1,1} = @(Phi,X,Y,Z)Beta(1,1)*abs(Phi{1}).^2 + Beta(1,2)*abs(Phi{2}).^2 + Etta(1)*(Gamma(1)*abs(Phi{1}).^2 + Gamma(2)*abs(Phi{2}).^2).^(3/2);
CoupledCubicNonlinearity{2,2} = @(Phi,X,Y,Z)Beta(2,2)*abs(Phi{2}).^2 + Beta(2,1)*abs(Phi{1}).^2 + Etta(2)*(Gamma(1)*abs(Phi{1}).^2 + Gamma(2)*abs(Phi{2}).^2).^(3/2);
CoupledCubicNonlinearity{1,2} = @(Phi,X,Y,Z) 0;
CoupledCubicNonlinearity{2,1} = @(Phi,X,Y,Z) 0;

end

