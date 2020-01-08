%% This function is for setting Rb and Na number
%% Input:
%%  NNa: Sodium Na number
%%  NRb: Rubidium Rb number
%% Output:
%%  Number: a structure saving atomic number

function [ Number ] = SetNumberRbNa( NNa, NRb )
Number.Na = NNa;
Number.Rb = NRb;
end

