function [l] = regresiva_pasos(X,y)
n = length(X);
p = length(X);
a(1) = y(1);
for k = 1 : n - 1
   d(k, 1) = (y(k+1) - y(k))/(X(k+1) - X(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(X(k+j) - X(k));
   end
end

l=zeros(n,n);
l(:,1)=y';
for p=1:n-1
    for r=2:n
        l(p,r)=d(p,r-1);
    end
end

end