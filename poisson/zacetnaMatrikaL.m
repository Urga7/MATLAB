function M=zacetnaMatrikaL(n, f)
    
    M = zeros(n);

    x = linspace(0, 2, n);
    y = linspace(2, 0, n);

    for j=1:floor(n/2)+1
        M(1,j) = f(x(j), 2);
    end
    for i=2 : floor(n/2)
        M(i,1) = f(0,y(i));
        M(i,floor(n/2)+1) = f(1,y(i));
    end
    for j=floor(n/2)+1:n
        M(floor(n/2),j) = f(x(j), 1);
    end
    for i=floor(n/2)+1 : n-1
        M(i,1) = f(0,y(i));
        M(i,n) = f(2, y(i));
    end
    for j=1:n
        M(n,j) = f(x(j), 0);
    end

end