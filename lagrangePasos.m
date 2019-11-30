function [t] = lagrangePasos(x,y)
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
        cont = cont+1;
        term = p*y(i);
        sum= sum + term;
    end
    p1='';
    n=length(x);
    for t=1:n
        if(sum(t) ~= 0)
            p1=strcat(p1,'(');
            p1=strcat(p1,num2str(sum(t)));
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
    
    t='';
    for k=1:length(x)
        t=strcat(t,'L');
        t=strcat(t,int2str(k-1));
        t=strcat(t,': ');
        for r=1:length(x)
            t=strcat(t,'(');
            t=strcat(t,num2str(pasos(k,r)));
            if (length(x)-r) ~= 0
                t=strcat(t,')x^');
                t=strcat(t,int2str(length(x)-r));
            else
                t=strcat(t,')');
            end
            if r ~= length(x)
                t=strcat(t,'+');
            elseif k ~= length(x)
                t=strcat(t,'||');
            end
        end
    end
    disp(p1);
    disp(t);
end