%computedilutionEffectStrength.m
function [res]=computedilutionEffectStrengthAllRandom(pI)
global tau;         % Competences
global b;           % Taux de naissance
global d;           % Taux de DC
global sigma;       % Periode d'infectiosite
global alpha;       % Virulence
global phi;         % Nombre de contacts
global m;           % Nombre d'especes vecteurs
global n;           % Nombre d'especes reservoirs
global nInit;           % Nombre d'especes reservoirs
global N;

N=0;
tau=0;
sigma=0;
phi=0;
b=0;
d=0;
alpha=0;

%clear phi;

n=round(rand()*40)+1;

m=round(rand()*10)+1;
for i=1:m
    N(i)=rand*100000;
    tau(i)=rand();
    sigma(i)=0;
end

for i=1:n
    N(m+i)=rand*1000;
    tau(m+i)=rand();
    sigma(m+i)=(365/7)*rand();
    alpha(m+i)=(365/14)*rand();
end

for i=1:m
    for j=1:n
        bRate=(365/20)*rand();
        phi(i,m+j)=bRate;
        phi(m+j,i)=bRate;
    end
end


b(1:m)=365/30;
b(m+1:m+n)=1/4;
d=b;
    
clear SInit IInit RInit;



SInit=N;
IInit(1:m+n)=0;
RInit(1:m+n)=0;
SInit(1)=N(1)-1;
IInit(1)=1;
options=[];

%save('temp.mat','N','m','n','tau','b','d','sigma','phi','SInit','RInit','IInit');
%load('temp.mat');


%[length(SInit) length(IInit) length(RInit) ]
[T,Y]=ode45(@rightSideVecteur,[0 10],[SInit IInit RInit],options);
Imax1=max(sum(Y(:,m+n+1:m+n+m)'));

save(['resultsNew/simuls' num2str(pI) '_1.mat'],'N','m','n','tau','b','d','alpha','sigma','phi','Imax1');

meanAlpha1=mean(alpha);
%res1=[m n tau alpha N sigma Imax reshape(phi,1,length(phi)*length(phi))];

clear SInit IInit RInit;
tau=0;
alpha=0;
sigma=0;
N=0;
phi=0;

propDecrease=rand();

n=round(n*propDecrease);

m=round(rand()*10);


if m==0
    m=1;
end
if n==0
    n=1;
end

b=0;
d=0;
b(1:m)=365/30;
b(m+1:m+n)=1/4;
d=b;

for i=1:m
    N(i)=rand*100000;
    tau(i)=rand();
    sigma(i)=0;
end

for i=1:n
    N(m+i)=rand*1000;
    tau(m+i)=rand();
    sigma(m+i)=(365/7)*rand();
    alpha(m+i)=(365/14)*rand();
end

for i=1:m
    for j=1:n
        bRate=(365/20)*rand();
        phi(i,m+j)=bRate;
        phi(m+j,i)=bRate;
    end
end

SInit=N;
IInit(1:m+n)=0;
RInit(1:m+n)=0;
SInit(1)=N(1)-1;
IInit(1)=1;
if length(N)<(length(SInit)+length(IInit)+length(RInit))/3
   tata=1; 
end
options=[];
%save('temp1.mat','N','m','n','tau','b','d','sigma','phi','SInit','RInit','IInit');
%load('temp1.mat');
[T,Y]=ode45(@rightSideVecteur,[0 10],[SInit IInit RInit],options);
Imax2=max(sum(Y(:,m+n+1:m+n+m)'));

%res2=[m n tau alpha N sigma Imax reshape(phi,1,length(phi)*length(phi))];
save(['resultsNew/simuls' num2str(pI) '_2.mat'],'N','m','n','tau','b','d','alpha','sigma','phi','Imax2','propDecrease');

meanAlpha2=mean(alpha);
res=[0,0];
if meanAlpha1<5 & meanAlpha2<5
    res(1)=1;
    res(2)=Imax2/Imax1;
end
