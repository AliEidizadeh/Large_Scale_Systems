%{
Second LSS Project 
Weakly Coupled System
Ali Eidizadeh 
ali80ei@gmail.com
%}
%%
J_dec_func = @(R_flat) ga_J_dec(R_flat);

% Set the bounds for the flattened R vector (each element is between 0 and 100)
lb = [0.00001, 0.00001]; % Lower bounds for R_flat
ub = [100, 100]; % Upper bounds for R_flat

% Define GA options (you can customize options as needed)
options = optimoptions('ga', 'Display', 'iter', 'PopulationSize', 50, 'MaxGenerations', 100, ...
    'PlotFcn', {@gaplotbestf, @gaplotstopping});

% Run the Genetic Algorithm
[R_opt_flat, fval] = ga(J_dec_func, 2, [], [], [], [], lb, ub, [], options);


disp(" ");
disp("The minimum value of J_dec is  ");
disp(fval);
disp(" ");
disp("The R that makes the solution optimal is ");
disp(diag(R_opt_flat));


A11=-0.5;
B11=[2 0];
K11=lqr(A11,B11,1,diag(R_opt_flat));
A22=[-2 -1;1 0];
B22=[0 1;0 0];
K22 = lqr(A22,B22,[1 0;0 1],diag(R_opt_flat));
K_dec = [K11, [0 0 ;0 0 ], K22];
tspan = [0 20];
x0 = [0.2; 0.2; 0.2; 0.2; 0.2]; 
[t_dec, x_dec] = ode45(@(t, x) MySystem_dec(t, x, K_dec), tspan, x0);
x_dec = x_dec';
u_dec = -K_dec * x_dec; 
figure
plot(t_dec,x_dec,'linewidth',2);
grid on
xlabel('Time');
ylabel('States');
title('Decentralized form');
legend('x_1','x_2','x_3','x_4','x_5');
figure
plot(t_dec,u_dec,'linewidth',2)
grid on
xlabel('Time')
ylabel('Control Signals')
title('Decentralized form')
legend('u_1','u_2')