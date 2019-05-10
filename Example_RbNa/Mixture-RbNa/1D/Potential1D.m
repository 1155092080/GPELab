function [pol] = Potential1D()

vx1=1/2*mNa/mu*omgxNa^2/omgm^2;
vy1=1/2*mNa/mu*omgyNa^2/omgm^2;
gy1=mNa*grav/sqrt(hbar*omgm^3*mu);
vz1=1/2*mNa/mu*omgzNa^2/omgm^2;
vx2=1/2*mRb/mu*omgxRb^2/omgm^2;
vy2=1/2*mRb/mu*omgyRb^2/omgm^2;
gy2=mRb*grav/sqrt(hbar*omgm^3*mu);
vz2=1/2*mRb/mu*omgzRb^2/omgm^2;

pol=cell(2);
pol{1,1}=@(x) vx1*x.^2;
pol{2,2}=@(x) vx2*x.^2;
end
