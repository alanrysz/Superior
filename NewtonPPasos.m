function [dif] = NewtonPPasos(X,Y) 
    n = length(X); 
    D = zeros(n,n); 
    D(:,1) = Y'; 
    Pasos=zeros(n,n);
    Pasos(:,1) = Y';
    for j=2:n,   
        for k=j:n,       
            D(k,j) = (D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));   
        end
    end
    for j=2:n,   
    for k=j:n,       
        Pasos(k,j) = (Pasos(k,j-1)-Pasos(k-1,j-1));
    end
    end
    C = D(n,n); 
    for k=(n-1):-1:1,   
        C = conv(C,poly(X(k)));   
        m = length(C);   
        C(m) = C(m) + D(k,k); 
    end
    dif=transpose(diag(Pasos));
end