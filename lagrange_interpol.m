function [pol, p3] = lagrange_interpol(x,y)
    sum=0;
    for i=1:length(x)
        p=1;
        for j=1:length(x)
            if j~=i
                c = poly(x(j))/(x(i)-x(j));
                p = conv(p,c);
            end
        end
        p3=poly2sym(p);
        disp(p3);
        term = p*y(i);
        sum= sum + term;
    end
    pol = poly2sym(sum);
end