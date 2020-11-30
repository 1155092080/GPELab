%% This function is for setting Interaction of Rb Na system
%% Input:
%%  Constants: physics constants
%%  Character: characteristic parameter of the system(define by user)
%%  Number: Rb and Na number
%% Output:
%%  Nonlinearity: defines the nonlinear interaction for the system
%%

function [ Nonlinearity ] = SetInteractionwLHYRbNa(Constants, Character, Number, LHY_Q)
%% atom numbers
NNa = Number.Na;
NRb = Number.Rb;

%% Introduce constants and character
mu = Constants.mu;
mNa = Constants.mNa;
mRb = Constants.mRb;
a11 = Constants.a11;
a22 = Constants.a22;
a12 = Constants.a12;
abar = Character.abar;

%% Set coupled parameter for Rb and Na. Note that Beta_coupled depend on atom number
% Beta for mean field energy
Beta_11=NNa*4*pi*(mu/mNa)*(a11/abar);
Beta_12=NRb*2*pi*(mu/mu)*(a12/abar);
Beta_21=NNa*2*pi*(mu/mu)*(a12/abar);
Beta_22=NRb*4*pi*(mu/mRb)*(a22/abar);
Beta = [Beta_11, Beta_12; Beta_21, Beta_22];

%Gamma and Etta for LHY term
Gamma_1 =(NNa*a11/abar)*(mu/mNa)^(2/5);
Gamma_2 = (NRb*a22/abar)*(mu/mRb)^(2/5);
Gamma = [Gamma_1, Gamma_2];
Etta_1 = (a11/abar)*(mu/mNa)^(2/5) * 128 * pi^(1/2) / 3;
Etta_2 = (a22/abar)*(mu/mRb)^(2/5) * 128 * pi^(1/2) / 3;
Etta = [Etta_1, Etta_2];

%% Definition of Beta, Gamma and Etta, please ref to the mathematica note: "Note_GPELAB_Droplet"
if LHY_Q
    Nonlinearity = cell(2);
    Nonlinearity{1,1} = @(Phi,X,Y,Z)Beta(1,1)*abs(Phi{1}).^2 + Beta(1,2)*abs(Phi{2}).^2 + Etta(1)*(Gamma(1)*abs(Phi{1}).^2 + Gamma(2)*abs(Phi{2}).^2).^(3/2);
    Nonlinearity{2,2} = @(Phi,X,Y,Z)Beta(2,2)*abs(Phi{2}).^2 + Beta(2,1)*abs(Phi{1}).^2 + Etta(2)*(Gamma(1)*abs(Phi{1}).^2 + Gamma(2)*abs(Phi{2}).^2).^(3/2);
    Nonlinearity{1,2} = @(Phi,X,Y,Z) 0;
    Nonlinearity{2,1} = @(Phi,X,Y,Z) 0;
else
    Nonlinearity = cell(2);
    Nonlinearity{1,1} = @(Phi,X,Y,Z)Beta(1,1)*abs(Phi{1}).^2 + Beta(1,2)*abs(Phi{2}).^2;
    Nonlinearity{2,2} = @(Phi,X,Y,Z)Beta(2,2)*abs(Phi{2}).^2 + Beta(2,1)*abs(Phi{1}).^2;
    Nonlinearity{1,2} = @(Phi,X,Y,Z) 0;
    Nonlinearity{2,1} = @(Phi,X,Y,Z) 0;
end

