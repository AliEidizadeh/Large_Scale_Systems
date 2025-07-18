%{
The MySystem_cen function defines the dynamics of a state-space control system,
calculating the state derivatives based on the system's state matrix A,
input matrix B, and LQR feedback control law u = −Kx.
%}

function xp = MySystem_cen(t, x)
    % Define the transfer function matrix G
    s = tf('s');
    G11 = 10/(2*s + 1);
    G12 = 0.6/(s + 1.5);
    G21 = 0.15/(s + 1.5);
    G22 = 1.5/(s + 1)^2;
    G=[G11 G12 ; G21 G22];
    % Convert G to state-space representation
    [A,B,C,D] = ssdata(G);

    % LQR parameters
    Q = eye(5); % Adjust based on your state dimensions
    R = eye(2); % Adjust based on your input dimensions

    % Calculate the LQR gain matrix
    K_cen = lqr(A, B, Q, R);

    % Calculate control input
    u = -K_cen * x; % State feedback control input

    % Calculate the state derivatives
    xp = A * x + B * u; % State equation
end