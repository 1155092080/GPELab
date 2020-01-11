%% This function is for refine wave function
%   for example, at beginning, we have a wavefunction with mesh 2^5+1 at
%   three dimension. Then we need refine it to 2^6+1 wavefunction
%% Input:
%%  phi: the original wavefunction with size 2^n+1
%% Output:
%%  phi_0 output wavefunction with size 2^(n+1)+1

function [ phi_0 ] = RefineWavefunction( phi )
[Nx, Ny, Nz] = size(phi);
phi_0 = repelem(phi,2,2,2);
phi_0(:,:,Nz) = [];
phi_0(:,Ny,:) = [];
phi_0(Nx,:,:) = [];
end

