function [ pol ] = PotentialHarmo( vx, vy, vz, gy, x, y, z )
pol = vx*x.^2+ vy*y.^2 + gy*y + vz*z.^2;
end
