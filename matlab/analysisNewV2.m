%analysis.m
clc
clear all
close all


nInit=20;
nbReplicates=600000;

m=2;

propDecreaseVec=0;
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
nbSpeciesR1=0;
nbSpeciesR2=0;
nbSpecies1=0;
nbSpecies2=0;
totalNV1=0;
totalNR1=0;
totalNV2=0;
totalNR2=0;
iter=1;
for i=1:573108
    %i
    load(['resultsNew/simuls' num2str(i) '_1.mat']);
    
    nbSpecies1(iter)=m+n;
    nbSpeciesV1(iter)=m;
    nbSpeciesR1(iter)=n;
    tau1=tau;
    varTauR1(iter)=var(tau1(nbSpeciesV1(iter)+1:nbSpecies1(iter)));
    alpha1=alpha;
    meanAlpha1(iter)=mean(alpha1);
    totalNV1(iter)=sum(N(1:m));
    totalNR1(iter)=sum(N(m+1:m+n));
    varSigma1(iter)=var(sigma);
    Imax1Temp=Imax1;
    phi1Temp=phi;
    varPhi1(iter)=var(var(phi1Temp(1:nbSpeciesV1(iter),nbSpeciesV1(iter)+1:nbSpecies1(iter))));
    
    Imax1=Imax1/sum(N(1:nbSpeciesV1(iter)));
    
    load(['resultsNew/simuls' num2str(i) '_2.mat']);
    propDecreaseVec(iter)=propDecrease;
    
    nbSpecies2(iter)=m+n;
    nbSpeciesV2(iter)=m;
    nbSpeciesR2(iter)=n;
    tau2=tau;
    varTauR2(iter)=var(tau2(nbSpeciesV2(iter)+1:nbSpecies2(iter)));
    alpha2=alpha;
    meanAlpha2(iter)=mean(alpha2);
    totalNV2(iter)=sum(N(1:m));
    totalNR2(iter)=sum(N(m+1:m+n));
    varSigma2(iter)=var(sigma);
    Imax2Temp=Imax2;
    phi2Temp=phi;
    varPhi2(iter)=var(var(phi2Temp(1:nbSpeciesV2(iter),nbSpeciesV2(iter)+1:nbSpecies2(iter))));
    
    Imax2=Imax2/sum(N(1:nbSpeciesV2(iter)));

    if i>400000 & i<600000
        %Generalist vectors
        varPhi1(iter)=0;
        varPhi2(iter)=0;
    end
    
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
save('resultsVar.mat','slope','varTauR1','varTauR2','meanAlpha1','meanAlpha2','varSigma1','varSigma2','varPhi1','varPhi2','propDecreaseVec','nbSpeciesV1','nbSpeciesV2','nbSpeciesR1','nbSpeciesR2','nbSpecies1','nbSpecies2','totalNV1','totalNR1','totalNV2','totalNR2');

