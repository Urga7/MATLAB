f = @(x, y) 7*sin(x*6) - 12*y.^2 + 4*y.^3 - 0.5*y - 5*y.^4 + 2*y.^6;
g = @(x, y) x - y;
n = 300;

[U, k] = PoissonL(f, g, n, 0.0005, 5000, 1.9);
l1=linspace(0, 2, n);
l2=linspace(2, 0, n);
figure('Name', 'Poissons equation on an L shaped matrix');
surf(l1, l2, U,'LineStyle','none');

graf(0.01, 1.99, 100, 80, 0.005, 500);