%{
Second LSS Project 
Weakly Coupled System
Ali Eidizadeh 
ali80ei@gmail.com
%}

%%
clear all;
close all;
clc;

% Define the fitness function
fitness_func = @(R_flat) ga_fitness(R_flat);

% Set the bounds for the flattened R vector (each element is between 0 and 100)
lb = [0.00001, 0.00001]; % Lower bounds for R_flat
ub = [100, 100]; % Upper bounds for R_flat

% Define GA options (you can customize options as needed)
options = optimoptions('ga', 'Display', 'iter', 'PopulationSize', 50, 'MaxGenerations', 100, ...
    'PlotFcn', {@gaplotbestf, @gaplotstopping});

% Run the Genetic Algorithm
[R_opt_flat, fval] = ga(fitness_func, 2, [], [], [], [], lb, ub, [], options);


disp(" ");
disp("The minimum value of |J_cen - J_dec| is  ");
disp(fval);
disp(" ");
disp("The R that makes the solution optimal is ");
disp(diag(R_opt_flat));


%Plotting in centralized control
s = tf('s');
G11 = 10/(2*s + 1);
G12 = 0.6/(s + 1.5);
G21 = 0.15/(s + 1.5);
G22 = 1.5/(s + 1)^2;
G=[G11 G12 ; G21 G22];
[A,B,C,D] = ssdata(G);
Q = eye(5);
R = eye(2);
K_cen = lqr(A , B , Q , R);
tspan = [0 20]; 
x0 = [0.2; 0.2; 0.2; 0.2; 0.2]; 
[t_cen, x_cen] = ode45(@(t, x) MySystem_cen(t, x, K_cen), tspan, x0);
x_cen = x_cen';
u_cen = -K_cen * x_cen; 
figure
plot(t_cen,x_cen,'linewidth',2);
grid on
xlabel('Time');
ylabel('States');
title('Centralized form');
legend('x_1','x_2','x_3','x_4','x_5');
figure
plot(t_cen,u_cen,'linewidth',2)
grid on
xlabel('Time')
ylabel('Control Signals')
title('Centralized form')
legend('u_1','u_2')
%Plotting in decentralized control
sys=ss(G,'minimal');
A_new = sys.A;
B_new = sys.B;
C_new = sys.C;
D_new = sys.D;
A11=-0.5;
B11=[2 0];
K11=lqr(A11,B11,1,diag(R_opt_flat));
A22=[-2 -1;1 0];
B22=[0 1;0 0];
K22 = lqr(A22,B22,[1 0;0 1],diag(R_opt_flat));
K_dec = [K11, [0 0 ;0 0 ], K22];
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