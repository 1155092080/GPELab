%% This function is for checking whether this wave function is normalization
%% The nomralizatio of a wavefunction in the descrete case is defined as:
%%;  sum(|wavefunction(point)|^2)*deltax*deltay*deltaz    in 3D case
%%  Here, our calculation all carried on the first part of it, i.e. the summation part
%%for futher check, you need times the spacial descrete to check whether the number is 1.
%%;
%% Input:
%%  Phi: wavefunction of any dimension
%%Output:
%%  sum: summation of square of all points

function [ output ] = CheckNorm( phi )
    %% get dimmension of wavefunction
    dim = length(size(phi));
    
    %% Get square of phi
    temp = phi.^2;
    
    %% Do summation for all dimmension
    for i = 1:dim
        temp = sum(temp);
    end
    output = temp;
    %% Directly return summation of all points inVer >  Matlab 2018b
    %output = sum(phi, 'all');
end

