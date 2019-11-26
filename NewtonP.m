function [C,D,equid] = NewtonP(X,Y) 
    n = length(X); 
    D = zeros(n,n); 
    D(:,1) = Y'; 
    equid=1;
    cont=2;
    resultadoOriginal=0;
    while equid==1 & cont <= n
        if cont == 2
            resultadoOriginal= X(cont) - X(cont-1);
            cont = cont+1;
        else if resultadoOriginal== X(cont) - X(cont-1)
            cont=cont+1;
        else
            equid = 0;
        end
    end
    for j=2:n,   
        for k=j:n,       
            D(k,j) = (D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));   
        end
    end
    C = D(n,n); 
    for k=(n-1):-1:1,   
        C = conv(C,poly(X(k)));   
        m = length(C);   
        C(m) = C(m) + D(k,k); 
    end    
end
