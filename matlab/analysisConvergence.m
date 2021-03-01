%analysis.m
clc
clear all
close all


nInit=20;
nbReplicates=15000;

m=2;

propDecrease=0;
slope=0;
meanSlope=0;
iter=1;
for i=1:nbReplicates
    %i
    data=load(['results/simul' num2str(i) '.dat']);
    propDecrease(iter)=data(1);
    nbSpecies1=data(2)+data(3);
    nbSpeciesV=data(2);
    nbSpeciesR=data(3);
    tau1=data(4:3+nbSpecies1);
    N1=data(4+nbSpecies1:3+nbSpecies1*2);
    sigma1=data(4+nbSpecies1*2:3+nbSpecies1*3);
    Imax1Temp=data(4+nbSpecies1*3);
    phi1=data(5+nbSpecies1*3:4+nbSpecies1*3+nbSpecies1*nbSpecies1);

    Imax1=Imax1Temp/sum(N1(1:nbSpeciesV));
    
    
    
    start2=3+3*nbSpecies1+nbSpecies1*nbSpecies1;
    
    nbSpecies2=data(start2+2)+data(start2+3);
    nbSpeciesV=data(start2+2);
    nbSpeciesR=data(start2+3);
    tau2=data(start2+4:start2+3+nbSpecies2);
    N2=data(start2+4+nbSpecies2:start2+3+nbSpecies2*2);
    sigma2=data(start2+4+nbSpecies2*2:start2+3+nbSpecies2*3);
    Imax2Temp=data(start2+4+nbSpecies2*3);
    phi2=data(start2+5+nbSpecies2*3:start2+4+nbSpecies2*3+nbSpecies2*nbSpecies2);

    Imax2=Imax2Temp/sum(N2(1:nbSpeciesV));
    
    %if Imax1>0.0001 & Imax2>0.0001
        iter
        slope(iter)=Imax2/Imax1;
        clear data;
        %if slope(iter)<1000
            if i>1
                meanSlope(iter)=mean(slope);
            end
            iter=iter+1;
        %end
    %end
end
plot(meanSlope);

