function [ pol ] = PotentialBox( XL, XR, YL, YR, ZL, ZR, x, y, z )
if ((x>XR)|(x<XL)|(y>YR)|(y<YL)|(z>ZR)|(z<ZL))
    pol = Inf;
else
    pol = 0;
end
end

