%analysis.m
clc
clear all
close all


nInit=20;
nbReplicates=100000;

m=2;

propDecrease=0;
slope=0;
meanSlope=0;
varTauR1=0;
varTauR2=0;
varPhi1=0;
varPhi2=0;
meanAlpha1=0;
meanAlpha2=0;
varSigma1=0;
varSigma2=0;
nbSpeciesV1=0;
nbSpeciesV2=0;
iter=1;
for i=1:nbReplicates
    %i
    data=load(['resultsNew/simuls' num2str(i) '_1.mat']);
    propDecrease(iter)=data(1);
    nbSpecies1=data(2)+data(3);
    nbSpeciesV=data(2);
    nbSpeciesR=data(3);
    nbSpeciesV1(iter)=nbSpeciesV;
    tau1=data(4:3+nbSpecies1);
    varTauR1(iter)=var(tau1(nbSpeciesV+1:nbSpecies1));
    alpha1=data(4+nbSpecies1:3+nbSpecies1*2);
    meanAlpha1(iter)=mean(alpha1);
    N1=data(4+nbSpecies1*2:3+nbSpecies1*3);
    sigma1=data(4+nbSpecies1*3:3+nbSpecies1*4);
    varSigma1(iter)=var(sigma1(nbSpeciesV+1:nbSpecies1));
    Imax1Temp=data(4+nbSpecies1*4);
    phi1=data(5+nbSpecies1*4:4+nbSpecies1*4+nbSpecies1*nbSpecies1);
    phi1Temp=reshape(phi1,nbSpecies1,nbSpecies1);
    varPhi1(iter)=var(var(phi1Temp(1:nbSpeciesV,nbSpeciesV+1:nbSpecies1)));
    
    Imax1=Imax1Temp/sum(N1(1:nbSpeciesV));
    
    
    
    start2=3+3*nbSpecies1+nbSpecies1*nbSpecies1;
    
    nbSpecies2=data(start2+2)+data(start2+3);
    nbSpeciesV=data(start2+2);
    nbSpeciesR=data(start2+3);
    nbSpeciesV2(iter)=nbSpeciesV;
    tau2=data(start2+4:start2+3+nbSpecies2);
    varTauR2(iter)=var(tau2(nbSpeciesV+1:nbSpecies2));
    alpha2=data(start2+4+nbSpecies2:start2+3+nbSpecies2*2);
    meanAlpha2(iter)=mean(alpha2);
    N2=data(start2+4+nbSpecies2*2:start2+3+nbSpecies2*3);
    sigma2=data(start2+4+nbSpecies2*3:start2+3+nbSpecies2*4);
    varSigma2(iter)=var(sigma2(nbSpeciesV+1:nbSpecies2));
    Imax2Temp=data(start2+4+nbSpecies2*4);
    phi2=data(start2+5+nbSpecies2*4:start2+4+nbSpecies2*4+nbSpecies2*nbSpecies2);
    phi2Temp=reshape(phi2,nbSpecies2,nbSpecies2);
    varPhi2(iter)=var(var(phi2Temp(1:nbSpeciesV,nbSpeciesV+1:nbSpecies2)));

    Imax2=Imax2Temp/sum(N2(1:nbSpeciesV));
    
    %if Imax1>0.0001 & Imax2>0.0001
        iter
        slope(iter)=Imax1/Imax2;
        clear data;
        %if slope(iter)<1000
            if i>1
                meanSlope(iter)=mean(slope);
            end
            iter=iter+1;
        %end
    %end
end
figure(1)
plot(propDecrease,log(slope),'.k');
xlabel('Decrease proportion')
figure(2)
plot(log(varTauR1./varTauR2),log(slope),'.k');
xlabel('Susceptibility variance')
figure(3)
plot(log(varPhi1./varPhi2),log(slope),'.k');
xlabel('Contact variance')
figure(4)
plot(nbSpeciesV1./nbSpeciesV2,log(slope),'.k');
xlabel('Vector species richness')
figure(5)
plot(log(varSigma1./varSigma2),log(slope),'.k');
xlabel('Variance in infectious period')
