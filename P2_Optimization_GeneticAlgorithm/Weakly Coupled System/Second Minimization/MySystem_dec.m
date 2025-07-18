%{
The MySystem_cen function defines the dynamics of a state-space control system,
calculating the state derivatives based on the system's state matrix A,
input matrix B, and LQR feedback control law u = −Kx.
%}

function xp = MySystem_dec(t, x,K_dec)
% Decentralized Form

A=[-0.5 0 0 0 0;
    0 -1.5 0 0 0
    0 0 -1.5 0 0
    0 0 0 -2 -1
    0 0 0 1 0];
B=[2 0;
   0.5 0;
   0 1;
   0 1;
   0 0];
C=[2.5 0 0.6 0 0;0 0.3 0 0 1.5];
D=[0 0;0 0];


u = -K_dec*x;

xp = A*x+B*u;

end