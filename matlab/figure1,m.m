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

m=1;

for i=1:nbReplicates
    i
    [correlationOneVec(i),pValueOneVec(i),slopeOneVec(i)]=computedilutionEffectStrength();
end
plot(correlationOneVec,slopeOneVec,'.k');

%m=15;

%for i=1:nbReplicates
%    [correlation(i),slope(i)]=computedilutionEffectStrength();
%end
%plot(correlation,slope);
