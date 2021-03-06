clc;
clear all;
close all;
a=[1 1 1];
b=[1 2 1];
p=length(a);
q=length(b);
o=p+q-1;
Y=a;
Y=Y';
X=zeros(o,p);
K=zeros(p-1,q);
K=[b;K];
L=zeros(p,o-q);
Z=[K,L];
W=Z;
P=Z;
while (q>0)
    W(:,[q,q+1])=W(:,[q+1,q]);
    P(:,[q,q+2])=P(:,[q+2,q]);
    q=q-1;
end
W([p-2,p-1],:)=W([p-1,p-2],:);
P([p-2,p],:)=P([p,p-2],:);
W=Z+W+P;
W=W';
A=W*Y;
A=A';
n=[0:o-1];
stem(n,A,':','square');
title({'Convolution of two DT Signals','using matrix method 2'});
xlabel('n as time samples');
ylabel('x(n)*y(n)');
