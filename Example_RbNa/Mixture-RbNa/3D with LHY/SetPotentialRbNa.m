%% This function is for set potential (outside potential)
%% Input:
%%
%% Output:
%%  
function [ pol ] = SetPotentialRbNa(Constants, Character, Number, gNa)
%% atom numbers
NNa = Number.Na;
NRb = Number.Rb;

%% Introduce constants and character
hbar = Constants.hbar;
mu = Constants.mu;
mNa = Constants.mNa;
mRb = Constants.mRb;
omgmbar = Character.omgmbar;

%% set trap potential parameters
omgxNa=2*pi*1e-6;
omgyNa=2*pi*1e-6;
omgzNa=2*pi*1e-6;
omgxRb=2*pi*1e-6;
omgyRb=2*pi*1e-6;
omgzRb=2*pi*1e-6;

%% Set gradient
gRb = - gNa * mNa/mRb * NNa/NRb;

%% Set trap potential
vx1=1/2*mNa/mu*omgxNa^2/omgmbar^2;
vy1=1/2*mNa/mu*omgyNa^2/omgmbar^2;
gy1=mNa*gNa/sqrt(hbar*omgmbar^3*mu);
vz1=1/2*mNa/mu*omgzNa^2/omgmbar^2;
vx2=1/2*mRb/mu*omgxRb^2/omgmbar^2;
vy2=1/2*mRb/mu*omgyRb^2/omgmbar^2;
gy2=mRb*gRb/sqrt(hbar*omgmbar^3*mu);
vz2=1/2*mRb/mu*omgzRb^2/omgmbar^2;

pol = cell(2);
pol{1,1}=@(x,y,z) vx1*x.^2+ vy1*y.^2 + gy1*y + vz1*z.^2;
pol{2,2}=@(x,y,z) vx2*x.^2+ vy2*y.^2 + gy2*y + vz2*z.^2;

end

