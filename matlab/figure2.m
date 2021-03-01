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
nbReplicates=200;

m=1;
for i=1:5
    for j=1:nbReplicates
        [i j]
        [correlationOneVec(i,j),slopeOneVec(i,j)]=computedilutionEffectStrengthRandom(i*2);
    end
end

boxplot(slopeOneVec');

