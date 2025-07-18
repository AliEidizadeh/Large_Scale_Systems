%{
The MySystem_cen function defines the dynamics of a state-space control system,
calculating the state derivatives based on the system's state matrix A,
input matrix B, and LQR feedback control law u = −Kx.
%}

function xp = MySystem2_dec(t, x,K_dec)
% Decentralized Form

A=[0	-0.0457	0;
   0.0312	-0.0786	0;
    0	0	-0.0100];

B=[0.2011	0.1829;
   0	0;
   0.0720	0.0720];

u = -K_dec*x;

xp = A*x+B*u;

end