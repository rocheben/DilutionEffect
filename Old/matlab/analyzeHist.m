clc
clear all
close all

load('resultsVar.mat');
figure(1);
hist(log10(slope),100)

figure(2)
%Amplification effect
id=find(slope>2);
length(id)

testTau1=varTauR1(id)-varTauR2(id);
testSigma1=varSigma1(id)-varSigma2(id);
testPhi1=varPhi1(id)-varPhi2(id);
testAlpha1=meanAlpha1(id)-meanAlpha2(id);
testDec1=propDecreaseVec(id);
testNV1=totalNV1(id)./totalNV2(id);
testNR1=totalNR1(id)./totalNR2(id);
testNbSpeciesV1=nbSpeciesV1(id)./nbSpeciesV2(id);
testNbSpeciesR1=nbSpeciesR1(id)./nbSpeciesR2(id);

id=find(slope<0.5);
length(id)

testTau2=varTauR1(id)-varTauR2(id);
testSigma2=varSigma1(id)-varSigma2(id);
testPhi2=varPhi1(id)-varPhi2(id);
testAlpha2=meanAlpha1(id)-meanAlpha2(id);
testDec2=propDecreaseVec(id);
testNV2=totalNV1(id)./totalNV2(id);
testNR2=totalNR1(id)./totalNR2(id);
testNbSpeciesV2=nbSpeciesV1(id)./nbSpeciesV2(id);
testNbSpeciesR2=nbSpeciesR1(id)./nbSpeciesR2(id);

id=find(slope>=0.5 & slope <=2);
length(id)

testTau3=varTauR1(id)-varTauR2(id);
testSigma3=varSigma1(id)-varSigma2(id);
testPhi3=varPhi1(id)-varPhi2(id);
testAlpha3=meanAlpha1(id)-meanAlpha2(id);
testDec3=propDecreaseVec(id);
testNV3=totalNV1(id)./totalNV2(id);
testNR3=totalNR1(id)./totalNR2(id);
testNbSpeciesV3=nbSpeciesV1(id)./nbSpeciesV2(id);
testNbSpeciesR3=nbSpeciesR1(id)./nbSpeciesR2(id);


[hTauAmp,pTauAmp,ciTauAmp,statsTauAmp]=ttest2(testTau1(~isinf(testTau1)),testTau3(~isinf(testTau3)),0.05,'both');
[hTauDilut,pTauDilut,ciTauDilut,statsTauDilut]=ttest2(testTau2(~isinf(testTau2)),testTau3(~isinf(testTau3)),0.05,'both');

[hSigmaAmp,pSigmaAmp,ciSigmaAmp,statsSigmaAmp]=ttest2(testSigma1,testSigma3,0.05,'both');
[hSigmaDilut,pSigmaDilut,ciSigmaDilut,statsSigmaDilut]=ttest2(testSigma2,testSigma3,0.05,'both');

[hAlphaAmp,pAlphaAmp,ciAlphaAmp,statsAlphaAmp]=ttest2(testAlpha1,testAlpha3,0.05,'both');
[hAlphaDilut,pAlphaDilut,ciAlphaDilut,statsAlphaDilut]=ttest2(testAlpha2,testAlpha3,0.05,'both');

[hDecAmp,pDecAmp,ciDecAmp,statsDecAmp]=ttest2(testDec1,testDec3,0.05,'both');
[hDecDilut,pDecDilut,ciDecDilut,statsDecDilut]=ttest2(testDec2,testDec3,0.05,'both');

[hNVAmp,pNVAmp,ciNVAmp,statsNVAmp]=ttest2(testNV1,testNV3,0.05,'both');
[hNVDilut,pNVDilut,ciNVDilut,statsNVDilut]=ttest2(testNV2,testNV3,0.05,'both');

[hNRAmp,pNRAmp,ciNRAmp,statsNRAmp]=ttest2(testNR1,testNR3,0.05,'both');
[hNRDilut,pNRDilut,ciNRDilut,statsNRDilut]=ttest2(testNR2,testNR3,0.05,'both');

[hNbSpeciesVAmp,pNbSpeciesVAmp,ciNbSpeciesVAmp,statsNbSpeciesVAmp]=ttest2(testNbSpeciesV1,testNbSpeciesV3,0.05,'both');
[hNbSpeciesVDilut,pNbSpeciesVDilut,ciNbSpeciesVDilut,statsNbSpeciesVDilut]=ttest2(testNbSpeciesV2,testNbSpeciesV3,0.05,'both');

[hNbSpeciesRAmp,pNbSpeciesRAmp,ciNbSpeciesRAmp,statsNbSpeciesRAmp]=ttest2(testNbSpeciesV1,testNbSpeciesV3,0.05,'both');
[hNbSpeciesRDilut,pNbSpeciesRDilut,ciNbSpeciesRDilut,statsNbSpeciesRDilut]=ttest2(testNbSpeciesV2,testNbSpeciesV3,0.05,'both');


subplot(7,3,1)
hist(testTau1,100)
subplot(7,3,2)
hist(testTau2,100)
subplot(7,3,3)
hist(testTau3,100)
subplot(7,3,4)
hist(testSigma1,100)
subplot(7,3,5)
hist(testSigma2,100)
subplot(7,3,6)
hist(testSigma3,100)
subplot(7,3,7)
hist(testPhi1,100)
subplot(7,3,8)
hist(testPhi2,100)
subplot(7,3,9)
hist(testPhi3,100)
subplot(7,3,10)
hist(testAlpha1,100)
subplot(7,3,11)
hist(testAlpha2,100)
subplot(7,3,12)
hist(testAlpha3,100)
subplot(7,3,13)
hist(testDec1,100)
subplot(7,3,14)
hist(testDec2,100)
subplot(7,3,15)
hist(testDec3,100)

subplot(7,2,9)
hist(testDec1,100)
subplot(7,2,11)
hist(testNV1,100)
subplot(7,2,13)
hist(testNR1,100)

subplot(7,2,4)
hist(testSigma2,100)
subplot(7,2,6)
hist(testPhi2,100)
subplot(7,2,8)
hist(testAlpha2,100)
subplot(7,2,10)
hist(testDec2,100)
subplot(7,2,12)
hist(testNV2,100)
subplot(7,2,14)
hist(testNR2,100)


