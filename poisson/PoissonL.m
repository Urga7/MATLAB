function [U, k] = PoissonL(f, g, n, tol, maxit, omega)

U0 = zacetnaMatrikaL(n,f);
h = 2 / n; % razdalja med dvema zaporednima tockama
U = U0; % zacetni priblizek
napaka = tol + 1;
k = 0;  % stevec
while (napaka > tol) && (k < maxit)
    for i=2 : floor(n/2)
        for j=2 : floor(n/2)
            U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1) - (h.^2)*g(i*h,j*h))/4; 
            U(i,j) = (1-omega)*U0(i,j) + omega*U(i,j);
        end
    end
    for i=floor(n/2)+1 : n-1
        for j=2:n-1
            U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1) - (h.^2)*g(i*h,j*h))/4;
            U(i,j) = (1-omega)*U0(i,j) + omega*U(i,j);
        end
    end
    napaka=max(max(abs(U-U0)));
    k=k+1;
    U0=U;
end
