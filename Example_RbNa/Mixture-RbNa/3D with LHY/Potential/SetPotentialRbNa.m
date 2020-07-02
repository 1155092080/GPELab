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
abar = Character.abar;

%% use harmonic potential
if 1
    % set trap potential parameters
    omgxNa=2*pi*100;
    omgyNa=2*pi*100;
    omgzNa=2*pi*100;
    omgxRb=2*pi*100;
    omgyRb=2*pi*100;
    omgzRb=2*pi*100;
    
    % Set gradient
    gRb = - gNa * mNa/mRb * NNa/NRb;
    
    % Set trap potential
    vx1=1/2*mNa/mu*omgxNa^2/omgmbar^2;
    vy1=1/2*mNa/mu*omgyNa^2/omgmbar^2;
    gy1=mNa*gNa/sqrt(hbar*omgmbar^3*mu);
    vz1=1/2*mNa/mu*omgzNa^2/omgmbar^2;
    vx2=1/2*mRb/mu*omgxRb^2/omgmbar^2;
    vy2=1/2*mRb/mu*omgyRb^2/omgmbar^2;
    gy2=mRb*gRb/sqrt(hbar*omgmbar^3*mu);
    vz2=1/2*mRb/mu*omgzRb^2/omgmbar^2;
    
    pol = cell(2);
    pol{1,1}=@(x,y,z) PotentialHarmo( vx1, vy1, vz1, gy1, x, y, z );
    pol{2,2}=@(x,y,z) PotentialHarmo( vx2, vy2, vz2, gy2, x, y, z );
end

%% use box potential
if 0
    % set box potential
    XL = -15*10^(-6)/abar;
    XR = 15*10^(-6)/abar;
    YL = -15*10^(-6)/abar;
    YR = 15*10^(-6)/abar;
    ZL = -15*10^(-6)/abar;
    ZR = 15*10^(-6)/abar;
    
    pol = cell(2);
    pol{1,1}=@(x,y,z) PotentialBox( XL, XR, YL, YR, ZL, ZR, x, y, z );
    pol{2,2}=@(x,y,z) PotentialBox( XL, XR, YL, YR, ZL, ZR, x, y, z );
end

end

