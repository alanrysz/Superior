function p1 = lagrange_interpol(x,y)
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
    p1='';
    n=length(x);
    for t=1:n
        disp(p(t));
        if(p(t) ~= 0)
            p1=strcat(p1,'(');
            p1=strcat(p1,num2str(p(t)));
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
