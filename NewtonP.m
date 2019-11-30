function [p1] = NewtonP(X,Y) 
    n = length(X); 
    D = zeros(n,n); 
    D(:,1) = Y'; 
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
    p1='';
    for t=1:n
        disp(C(1,t));
        if(C(1,t) ~= 0)
            p1=strcat(p1,'(');
            p1=strcat(p1,num2str(C(1,t)));
            if (n-t) ~= 0
                p1=strcat(p1,')x^');
                p1=strcat(p1,int2str(n-t));
            else
                p1=strcat(p1,')');
            end
            if t ~= n
                p1=strcat(p1,'+');
            end
        end
    end
end