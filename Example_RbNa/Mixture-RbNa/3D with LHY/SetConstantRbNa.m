%% Set physics contants for Rb Na mixture system
%% Input:
%%  a12: Rb Na scattering length
%% Output:
%%  Constants: a structure including all constants for simulation
function [ Constants ] = SetConstantRbNa(a12bar)

%% Basic physics constants
hbar = 6.626070040E-34/2/pi;    %Planck constant
mu0 = pi*4E-7;  %permeability constants
c0 = 299792458; %speed of light
epsilon0 = 1/(mu0*(c0)^2); %vacuum permitivity
me = 9.10938356E-31;  %electron mass
e = 1.6021766208E-19;  %electron charge
a0 = 4*pi*epsilon0*hbar^2/(me*e^2);   %Bohr radius
AMU = 1.66053904E-27;  %Atomic unit mass

Constants.hbar = hbar;
Constants.mu0 = mu0;
Constants.c0 = c0;
Constants.epsilon0 = epsilon0;
Constants.me = me;
Constants.e = e;
Constants.a0 = a0;
Constants.AMU = AMU;

%%Rb Na information
mNa = 23*AMU;   %sodium mass
mRb = 87*AMU;   %Rb mass
mu = mNa*mRb/(mNa+mRb); %reduction mass
a11 = 54.5*a0;  %sodium scattering length
a22 = 100.4*a0; %Rb scattering length
a12 = a12bar*a0;   %Na-Rb scattering length

Constants.mNa = mNa;
Constants.mRb = mRb;
Constants.mu = mu;
Constants.a11 = a11;
Constants.a22 = a22;
Constants.a12 = a12;

end

