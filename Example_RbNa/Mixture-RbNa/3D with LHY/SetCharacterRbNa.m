%% This function is for setting Characteristic parameter of Rb Na system
%% Input:
%%  Constants: define physics constans form SetConstantRbNa
%%  CharaLength: which define characteristic length by user
%% Output:
%%  Chracter: structure including characteristic length, freq and time

function [ Character ] = SetCharacterRbNa( Constants, CharaLength )

abar = CharaLength;
omgmbar = Constants.hbar/(abar^2*Constants.mu);
tbar = 1/omgmbar;

Character.omgmbar = omgmbar;
Character.abar = abar;
Character.tbar = tbar;

end

