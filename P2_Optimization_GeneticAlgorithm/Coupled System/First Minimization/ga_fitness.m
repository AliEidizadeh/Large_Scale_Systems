function fitness = ga_fitness(R_flat)

    % Reshape R_flat into a 2x2 matrix (or whatever size is appropriate for your system)
    R = diag(R_flat);  
    
    J_cen=2.9810;


    % Decentralized controller (similar to the previous approach)

    A11=[0	-0.0457;
         0.0312	-0.0786];
    B11=[0.2011	0.1829;
         0        0];
    K11=lqr(A11,B11,[1 0;0 1],R);
    A22=-0.0100;
    B22=[0.0720	0.0720];
    K22 = lqr(A22,B22,1,R);
    K_dec = [K11, K22];



    tspan = [0 500]; % Time span for the simulation
    x0 = [0.3; 0.3; 0.3]; % Initial state vector
    Q = eye(3);
    % Run the ODE solver for the decentralized case
    [t_dec, x_dec] = ode45(@(t, x) MySystem2_dec(t, x, K_dec), tspan, x0);
    % Transpose x if needed for further analysis
    x_dec = x_dec';
    u_dec = -K_dec * x_dec; % Control inputs

    % Calculate cost for the decentralized controller
    pts_dec = 0;   % Previous time step
    x_Transpose_dec = x_dec';
    J_dec = 0;

    for i = 1:length(t_dec)-1
        dt = t_dec(i) - pts_dec; 
        pts_dec = t_dec(i);
        S_dec = (x_Transpose_dec(i,:) * Q * x_dec(:,i)) * dt;
        J_dec = S_dec + J_dec;
    end
    
    % Return fitness as the absolute difference in cost
    fitness = abs(J_cen - J_dec);
 
    disp(R);
    disp(fitness);

end
