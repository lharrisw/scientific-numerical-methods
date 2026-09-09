%%
clear
clc
close all

% Define domain and parameters
a = 1; % radius of the disk
dx = 0.02; % spatial step size
dt = 0.01; % time step size
c = 1; % wave speed
r = c*dt/dx; % courant number

if r > 1
    error("The Courant number is greater than or equal to 1. It must be less than 1.")
end

tmax = 25; % simulation time
t = 0:dt:tmax; % time steps
x = -a:dx:a; % discretization in x
y = x; % discretization in y
[X,Y] = meshgrid(x,y); % grid
idx = (X.^2 + Y.^2 <= a^2); % disc region for initial velocity
D = idx.*((abs(X).^2 + abs(Y).^2) <= (0.5*a)^2); % initial velocity

% Initialize solution arrays
u = zeros(length(x),length(y)); %
u_prev = u;
u_next = u;
u = D;

% Indexing for faster code
I = 2:length(x)-1;
J = 2:length(y)-1;

% Finite difference method
figure
for k=1:length(t)-1
    % Solution using nested for-loops
%     for i=2:length(x)-1
%         for j=2:length(y)-1
%             u_next(i,j) = 2*u(i,j) - u_prev(i,j) + r^2*(u(i+1,j) - 2*u(i,j) + u(i-1,j) + u(i,j+1) - 2*u(i,j) + u(i,j-1));
%         end
%     end
    % Solution using indexing
    u_next(I,J) = 2*u(I,J) - u_prev(I,J) + r^2*(u(I+1,J) - 2*u(I,J) + u(I-1,J) + u(I,J+1) - 2*u(I,J) + u(I,J-1));
    
    u_prev = u;
    u = u_next;
    
    mesh(X,Y,u);
    axis([-a a -a a -50 50])
    xlabel('x','interpreter','latex');
    ylabel('y','interpreter','latex');
    zlabel('u','interpreter','latex');
    title(sprintf('Wave Equation Solution at t=%0.2f', t(k)),'interpreter','latex');
    set(gca,'fontsize',20)
    pause(0.00001)
end
