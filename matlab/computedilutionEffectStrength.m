%computedilutionEffectStrength.m
function [correlation,slope]=computedilutionEffectStrength()
global tau;         % Competences
global b;           % Taux de naissance
global d;           % Taux de DC
global sigma;       % Periode d'infectiosite
global phi;         % Nombre de contacts
global m;           % Nombre d'especes vecteurs
global n;           % Nombre d'especes reservoirs
global nInit;           % Nombre d'especes reservoirs
global N;

n=nInit;

Nr=linspace(100,10000,n);
Nm(1:m)=100000;
Nvec=[Nm Nr];


tauM(1:m)=0.9;
tauvec=[tauM rand(1,n)];
%tauvec=[tauM linspace(0,1,n)];

c=corrcoef(tauvec(m+1:end),Nvec(m+1:end));
correlation=c(2,1);


b(1:m)=365/30;
b(m+1:m+n)=1/4;
d=b;
sigma(1:m)=0;
sigma(m+1:m+n)=365/7;

for i=1:m
    for j=1:n
        phi(i,m+j)=365/20;
        phi(m+j,i)=365/20;
    end
end

for i=1:10;
    N=[Nvec(1:m) Nvec(m+i:end)];
    tau=[tauvec(1:m) tauvec(m+i:end)];
    n=nInit-i+1;
    x(i)=n;
    
    
    
    clear SInit IInit RInit;
    phi=0;
    
    for p=1:m
        for q=1:n
            phi(p,m+q)=(365/3)*(1/n);
            phi(m+q,p)=(365/3)*(1/n);
        end
    end
    
    SInit=N;
    IInit(1:m+n)=0;
    RInit(1:m+n)=0;
    SInit(1)=N(1)-1;
    IInit(1)=1;

    options=[];
    [T,Y]=ode45(@rightSideVecteur,[0 10],[SInit IInit RInit],options);
    Imax(i)=max(sum(Y(:,m+n+1:m+n+m)'));
end

temp=linearReg(x,Imax,0,1);
slope=temp(1);
