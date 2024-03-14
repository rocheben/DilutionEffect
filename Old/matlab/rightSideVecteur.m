function res=rightSideVecteur(t,pState)

%On rï¿½cupï¿½re les variables globales
global tau;         % Competences
global b;           % Taux de naissance
global d;           % Taux de DC
global sigma;       % Periode d'infectiosite
global alpha;       % Virulence
global phi;         % Nombre de contacts
global m;           % Nombre d'especes vecteurs
global n;           % Nombre d'especes reservoirs
global N;           % Nombre d'especes reservoirs

%On initialise les variables
NbEspeces=length(pState)/3;
pS=pState(1:NbEspeces);
pI=pState(NbEspeces+1:NbEspeces*2);
pR=pState(NbEspeces*2+1:NbEspeces*3);

%Calcul de la densité d'individus en contact
dens=ones(NbEspeces,NbEspeces);
for i=1:m
    for j=m+1:m+n
        %dens(i,j)=N(i)/N(j);
        dens(i,j)=1;
    end
end
%Calcul de la matrice de contact
lambda=zeros(NbEspeces,1);
if NbEspeces>length(N)
    tata=1;
end
for i=1:NbEspeces
    for j=1:NbEspeces
        lambda(i)=lambda(i)+(phi(i,j))*dens(j,i)*tau(i)*(pI(j)/N(j));
    end
end

for i=1:NbEspeces
    dsdt(i)=b(i)*N(i)-(lambda(i)+d(i))*pS(i);
    didt(i)=lambda(i)*pS(i)-(sigma(i)+d(i)+alpha(i))*pI(i);
    drdt(i)=sigma(i)*pI(i)-d(i)*pR(i);
end

res=[dsdt didt drdt]';
