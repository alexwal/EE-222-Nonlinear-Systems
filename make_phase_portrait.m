% Plots the phase plane of general solutions.
% Reference: https://www.youtube.com/watch?v=wEOCPG5yHdk

% Create figure.
figure;

% Create a meshgrid (coordinates), assigning X1, X2 values.
[x1min, x1max] = deal(-10, 10);
[x2min, x2max] = deal(-10, 10);
[x1, x2] = meshgrid(x1min:1:x1max, x2min:1:x2max);

% Enter system of equations (**).
% Coordinates (x1(i), x2(j)) are possible inputs on meshgrid.
x1_dot = x1 + x2;
x2_dot = 4 * x1 - 2 * x2;

% Returns a column x_dot evaluated at x(t), such that:
%   x_dot = f(x(1), x(2)) = (x(1)_dot, x(2)_dot).
% (Make sure ode_f and (**) represent the same system.)
ode_f = @(t, x) [
    x(1) + x(2);
    4 * x(1) - 2 * x(2);
]; 

% Plot the vector field with arrows.
quiver(x1, x2, x1_dot, x2_dot);

% Configure plot.
xlabel('x1');
ylabel('x2');
title('Phase Plot Example');
xlim([x1min, x1max]);
ylim([x2min, x2max]);
grid % Draws grid on plot

hold on

% Solve ODE to put a trajectory phi(t) on plot,
% starting from initial condition:
%   phi(0) = [x1_0, x2_0] = x0.
x1_0 = -3;
x2_0 = 8;
t_min = 0;
t_max = 10;
t_range = [t_min, t_max];
x0 = [x1_0, x2_0];
[t, phi] = ode45(ode_f, t_range, x0);

% Plot trajectory phi(t) on the open figure.
plot(phi(:, 1), phi(:, 2), 'k') % first column of phi is x1(t) from x1_0,
                                % second column is x2(t) from x2_0.
