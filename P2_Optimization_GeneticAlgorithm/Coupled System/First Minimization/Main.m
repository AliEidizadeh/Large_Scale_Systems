%{
Second LSS Project 
Weakly Coupled System
Ali Eidizadeh 
ali80ei@gmail.com
%}
%%
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
G11 = 2.2/((20*s + 1)*(35*s+1));
G12 = 2/((20*s + 1)*(35*s+1));
G21 = 1.8/(100*s + 1);
G22 = 1.5/(100*s + 1);
G=[G11 G12 ; G21 G22];
[A,B,C,D] = ssdata(G);
Q = eye(3);
R = eye(2);
K_cen = lqr(A , B , Q , R);
tspan = [0 1000];
x0 = [0.3; 0.3; 0.3];
[t_cen, x_cen] = ode45(@(t, x)MySystem2_cen(t, x, K_cen), tspan, x0);
x_cen = x_cen';
u_cen = -K_cen * x_cen; 
figure
plot(t_cen,x_cen,'linewidth',2)
grid on
xlabel('Time');
ylabel('States');
title('Centralized form');
legend('x_1','x_2','x_3');
figure
plot(t_cen,u_cen,'linewidth',2);
grid on
xlabel('Time');
ylabel('Control Signals');
title('Centralized form');
legend('u_1','u_2');
%Plotting in decentralized control
sys=ss(G,'minimal');
A_new = sys.A;
B_new = sys.B;
C_new = sys.C;
D_new = sys.D;
A11=[0	-0.0457;
     0.0312	-0.0786];
B11=[0.2011	0.1829;
     0        0];
K11=lqr(A11,B11,[1 0;0 1],diag(R_opt_flat));
A22=-0.0100;
B22=[0.0720	0.0720];
K22 = lqr(A22,B22,1,diag(R_opt_flat));
K_dec = [K11, K22];
[t_dec, x_dec] = ode45(@(t, x)MySystem2_dec(t, x, K_dec), tspan, x0);
x_dec = x_dec';
u_dec = -K_dec * x_dec; 
figure
plot(t_dec,x_dec,'linewidth',2);
grid on
xlabel('Time');
ylabel('States');
title('Decentralized form');
legend('x_1','x_2','x_3');
figure
plot(t_dec,u_dec,'linewidth',2);
grid on
xlabel('Time');
ylabel('Control Signals');
title('Decentralized form');
legend('u_1','u_2');