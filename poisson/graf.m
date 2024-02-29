function graf(o1, o2, m, n, tol, maxit)

f = @(x, y) 7*sin(x*6) - 12*y.^2 + 4*y.^3 - 0.5*y - 5*y.^4 + 2*y.^6;
g = @(x, y) x - y;

x = linspace(o1, o2, m);
delta = (o2 - o1) / (m - 1);
K = [1, m];

for i = 1 : m
    omega = o1 + (i - 1)*delta;
    [~, k] = PoissonL(f, g, n, tol, maxit, omega);
    K(i) = k;
end

figure('Name', 'Number of needed iterations');
plot(x, K);
xlabel('Omega');
ylabel('Number of iterations');
title('Iterations(Omega)');