function [T, s] = bodyMotion2D(m1, m2, r_init, v1_init, v2_init, t_max, dt, sim_speed)

% Initial position of the bodies
x1 = [0, 0];
x2 = [r_init(1), r_init(2)];

% Inital velocities of the bodies
v1 = v1_init;
v2 = v2_init;

% Gravitational constant
G = 6.6743 * 10^(-11);

% Time initialisation
t = 0;

% Setting up the plot
figure(1);
hold on;
grid on;
xlabel('x position');
ylabel('y position');
title('Two Bodies Under Gravitational Influence');
axis equal;

% Arrays to store the area swept at a certain time
T = zeros(1, ceil(t_max/dt));
s = zeros(1, ceil(t_max/dt));

% Initializing variables to calculate the area swept
area = 0;

it = 1;

while t < t_max
    
    % Distance between the bodies
    rx = x2(1) - x1(1);
    ry = x2(2) - x1(2);
    r = sqrt(rx^2 + ry^2);


    % Calculate the area swept in this time step using trapezoidal rule
    area = area + dt * norm(v2) * r / 2;
    T(it) = t;
    s(it) = area;

    % Check for colision
    if r < 1
        % Stop the simulation if the bodies
        % collide or get to close
        disp('Collision detected or bodies too close');
        break;
    end
    
    % Calculate the gravitational force, acceleration,
    % velocities and the next position of the bodies.
    F = (G * m1 * m2) / r^2; 
    Fx = F * rx / r;
    Fy = F * ry / r;
    
    a1 = [Fx / m1, Fy / m1]; 
    a2 = [-Fx / m2, -Fy / m2];
    
    v1 = v1 + a1 * dt; 
    v2 = v2 + a2 * dt;

    x1 = x1 + v1 * dt; 
    x2 = x2 + v2 * dt;

    % Plot current positions
    % and update the plot
    plot(x1(1), x1(2), 'ro');
    plot(x2(1), x2(2), 'bo');
    drawnow;

    % Increment time
    t = t + dt;

    it = it + 1;

    pause(1 / sim_speed);

end