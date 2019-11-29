function Polinomio = newton_regre(X,y)
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
M = d;
 M1 = vpa(M(1,:),4);
for j = 2 : n
   a(j) = d(1, j-1);
end
Df(1) = 1;
c(1) = a(1);
for j = 2 : n
   Df(j)=(p - X(j-1)) .* Df(j-1);
   c(j) = a(j) .* Df(j);
end
syms x
aux = length(M1);
m = 1;
while m < (n+1)
  A(m) = (x-(X(m)));
  m=m+1;
end
  o = 3;
  R(1)=vpa(y(1),4);
  R(2)=(A(1).*(M1(1)));
while o < (n+1) && M1(o-2)~=0
  R(o)=((R(o-1))/(M1(o-2))).*(A(o-1)).*(M1(o-1));
  o= o+1;
end
Poli = sum(R);
Polinomio = simplify(Poli);
Polinomio = vpa(expand(Polinomio),4);
end