%% This function is for setting Characteristic parameter of Rb Na system
%% Input:
%%  Constants: define physics constans form SetConstantRbNa
%%  CharaLength: which define characteristic length by user
%% Output:
%%  Chracter: structure including characteristic length, freq and time

function [ Character ] = SetCharacterRbNa( Constants, CharaLength )

omgxNa=2*pi*100;
omgyNa=2*pi*100;
omgzNa=2*pi*100;
omgxRb=2*pi*100;
omgyRb=2*pi*100;
omgzRb=2*pi*100;

%abar = CharaLength;
%omgmbar = Constants.hbar/(abar^2*Constants.mu);
omgmbar = (omgxNa*omgyNa*omgzNa*omgxRb*omgyRb*omgzRb)^(1/6);%characteristic time by trap
abar = sqrt(Constants.hbar/Constants.mu/omgmbar);
tbar = 1/omgmbar;

Character.omgmbar = omgmbar;
Character.abar = abar;
Character.tbar = tbar;

end

