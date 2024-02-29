%%%% Adjustable parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0 = randi([1, 1000]);      % Starting population
c = randi([x0, 1000000]);   % Maximum population (capacity)
r = rand;                   % Growth rate
n = 500;                    % Number of (t, x(t)) pairs
t1 = 0;                     % First t
tn = 15 / r;                % Last t (15/r in order to prevent divergence)
data_noise_amplitude = 0.3; % Amplitude of data distortion
r_noise_amplitude = 0.25;   % Amplitude of r distortion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t, x] = create_noisy_data(x0, c, r, n, t1, tn, data_noise_amplitude); % Prepare data
r_inaccurate = r + (rand - 0.5)*r*r_noise_amplitude; % Make the r a bit distorted

[x0_opt, c_opt, r_opt] = logisticFit(t, x, r_inaccurate); % Calculate optimal parameters
draw(t, x, x0_opt, c_opt, r_opt); % Display the results

function y = f(t, x0, c, r)
    % Logistic growth function
    y = (x0.*c) ./ (x0 + (c - x0).*exp(-r.*t));
end

function draw(t, x, x0_opt, c_opt, r_opt)
    % Draws the inital data and the fitted function on a graph
    plot(t, x, 'b.');

    hold on;

    t_fine = linspace(min(t), max(t), 1000);
    x_fitted = f(t_fine, x0_opt, c_opt, r_opt);
    plot(t_fine, x_fitted, 'r-');
    xlabel('t');
    ylabel('x');
    legend('Initial data', 'Fitted curve');
    title('Logistic growth curve fitting');

    hold off;
end

function [t, x] = create_noisy_data(x0, c, r, n, t1, tn, noise_amplitude)
    % Creates (t, x(t)) pairs where the x(t) is distorted
    t = linspace(t1, tn, n);
    x = f(t, x0, c, r);
    noise = make_noise(x, noise_amplitude);
    x = x + noise;
end

function noise = make_noise(x, amplitude)
    % Creates a noise vector
    noise = zeros(1, length(x));
    for i = 1 : length(noise)
        noise(i) = amplitude * x(i) * (rand - 0.5);
    end
end