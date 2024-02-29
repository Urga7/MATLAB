function [x0_opt, c_opt, r_opt] = logisticFit(t, x, r)
% Finds the optimal parameters for a given 
% data set and an approximate growth rate r

f = @(t, x0, c, r) (x0.*c) ./ (x0 + (c - x0).*exp(-r.*t)); % Logistic growth function

x0 = x(1); % Initial guess for the starting population
c = max(x); % Initial guess for the maximum population
a = [x0; c; r]; % Initalise the parameter vector

% Gauss-Newton Iteration:
tol = 0.000005; % Error tolerance
maxit = 100; % Maximum number of iterations allowed
it = 0; % Iteration counter
while it < maxit

    d_dx0 = -(a(2)^2 .* exp(a(3).*t)) ./ ((exp(a(3).*t) - 1) .* a(1) + a(2)).^2;                         % Derivative (d/dx_0)F
    d_dc = -((exp(a(3).*t) - 1) .* exp(a(3).*t) .* a(1)^2) ./ (a(2) + (exp(a(3).*t) - 1) .* a(1)).^2;    % Derivative (d/dc)F
    d_dr = -(a(1) .* a(2) .* (a(2)-a(1)) .* t .* exp(t.*a(3))) ./ (a(1).*exp(t.*a(3)) - a(1) + a(2)).^2; % Derivative (d/dr)F
    J = [d_dx0' d_dc' d_dr']; % Jacobian matrix of function F = x - fi(t)

    F = (x - f(t, a(1), a(2), a(3)))'; % Residuals
    delta = -(J' * J) \ (J' * F);  % GN iteraiton
    a = a + delta; % Data correction

    squareSum = 0; % Calculate the sum of error squares
    for i = 1 : length(delta)
        squareSum = squareSum + delta(i)^2;
    end

    if squareSum < tol % Check for convergence
        break;
    end

    it = it + 1; % Increment counter

end

x0_opt = a(1);
c_opt = a(2);
r_opt = a(3);

% Display results
disp(['x0_opt = ', num2str(x0_opt)]);
disp(['c_opt = ', num2str(c_opt)]);
disp(['r_opt = ', num2str(r_opt)]);