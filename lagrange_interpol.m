function pol = lagrange_interpol(x,y)
    sum=0;
    for i=1:length(x)
        p=1;
        for j=1:length(x)
            if j~=i
                c = poly(x(j))/(x(i)-x(j));
                p = conv(p,c);
            end
        end
        term = p*y(i);
        sum= sum + term;
    end
    pol = poly2sym(sum);
    disp(poly2sym(sum));
    disp(sum);
end