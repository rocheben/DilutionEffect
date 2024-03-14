%main.m
clc
clear all
close all

global tau;         % Competences
global b;           % Taux de naissance
global d;           % Taux de DC
global sigma;       % Periode d'infectiosite
global phi;         % Nombre de contacts
global per;         % Période du cycle de population
global amp;         % Amplitude du cycle de population
global m;           % Nombre d'especes vecteurs
global n;           % Nombre d'especes reservoirs
global nInit;           % Nombre d'especes reservoirs
global N;

nInit=20;

m=1;
jVec=linspace(1,20,10);
for j=1:10
    j
    n=20;

    Nr=linspace(100,10000,n);
    Nm(1:m)=100000;
    Nvec=[Nm Nr];

    tauM(1:m)=0.9;
    tauvec=[tauM linspace(0,1,n)];

    b(1:m)=365/30;
    b(m+1:m+n)=1/4;
    d=b;
    sigma(1:m)=0;
    sigma(m+1:m+n)=365/7;
    
    for i=1:11;
        N=[Nvec(1:m) Nvec(m+i:end)];
        tau=[tauvec(1:m) tauvec(m+i:end)];
        n=nInit-i+1;
        x(i)=n;
    
        clear SInit IInit RInit;
        phi=0;
    
        phiMax=(365/3)*(1/20)*jVec(j);
        phiOther=((365/3)-phiMax)/(n-1);
        if phiOther<0
            phiOther=0;
        end
        for p=1:m
            for q=1:n
                phi(p,m+q)=phiOther;
                phi(m+q,p)=phiOther;
            end
        end
        phi(m,m+n)=phiMax;
        phi(m+n,m)=phiMax;
    
        SInit=N;
        IInit(1:m+n)=0;
        RInit(1:m+n)=0;
        SInit(1)=N(1)-1;
        IInit(1)=1;

        options=[];
        [T,Y]=ode45(@rightSideVecteur,[0 10],[SInit IInit RInit],options);
        Imax(i)=max(Y(:,m+n+1:m+n+m));
    end
    temp=linearReg(x,Imax,0,1);
    slope(j)=temp(1);
end

plot(1:10,slope);
