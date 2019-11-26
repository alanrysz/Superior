function [pasos] = lagrangePasos(x,y)
    sum=0;
    pasos = zeros(length(x),length(x));
    cont=1;
    for i=1:length(x)
        p=1;
        for j=1:length(x)
            if j~=i
                c = poly(x(j))/(x(i)-x(j));
                p = conv(p,c);
            end
        end
        for t=1:length(p)
            pasos(cont, t)=p(t);
        end
        term = p*y(i);
        sum= sum + term;
        cont = cont+1;
    end
        
    for n=1:length(x)
        display(poly2sym(pasos(n,:)));
    end
end