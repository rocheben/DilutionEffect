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
nbReplicates=500;

m=2;

for i=1:nbReplicates
    i
    [correlationOneVec(i),slopeOneVec(i)]=computedilutionEffectStrengthS1();
end
plot(correlationOneVec,slopeOneVec,'.k');


   p1 = -235.21
  p2 = -113.28
  
hold on
x=linspace(min(correlationOneVec),max(correlationOneVec),100);
plot(x,p1.*x+p2);


[counts,bins] = hist(slopeOneVec,50); %# get counts and bin locations
barh(bins,counts)

p1 = -824.81
  p2 = -198.24
  


%m=15;

%for i=1:nbReplicates
%    [correlation(i),slope(i)]=computedilutionEffectStrength();
%end
%plot(correlation,slope);
