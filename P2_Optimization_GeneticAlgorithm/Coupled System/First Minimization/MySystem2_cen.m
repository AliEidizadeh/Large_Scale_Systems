%{
The MySystem_cen function defines the dynamics of a state-space control system,
calculating the state derivatives based on the system's state matrix A,
input matrix B, and LQR feedback control law u = −Kx.
%}

function xp = MySystem2_cen(t, x,K_cen)
    % Define the transfer function matrix G
    
    A=[0 -0.0457 0;
       0.0312 -0.0786 0;
       0  0   -0.0100];
    B=[0.2011	0.1829;
        0         0;
        0.0720	0.0720];
    

    % Calculate control input
    u = -K_cen * x; % State feedback control input

    % Calculate the state derivatives
    xp = A * x + B * u; % State equation
end