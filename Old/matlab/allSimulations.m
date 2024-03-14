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
global nInit;       % Nombre d'especes reservoirs
global N;


nInit=20;
nbReplicates=1;
dilEff=[];

for i=1:573108
    i
    if i<400000
        res=computedilutionEffectStrengthAllRandom(i);
    else
        res=computedilutionEffectStrengthAllRandomGen(i);
    end
    if res(1)==1
        dilEff=[dilEff,res(2)];
        mean(dilEff)
    end
end

