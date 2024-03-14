%figures.m
clc
clear all
close all


load('resultsVar.mat');

%slope=slope(find(nbSpeciesR1~=nbSpeciesR2));
realPropDecrease=nbSpeciesR2./nbSpeciesR1;
index=1:length(realPropDecrease);
%propDecreaseVec=propDecreaseVec(find(nbSpeciesR1>3 & nbSpeciesR2>3));
id=find(slope>0.1 & slope<10 & index<400000);


%%%%%%%%%%%% Figure 1 %%%%%%%%%%%%
figure1=figure(1);
axes1 = axes('Parent',figure1,'XTickLabel',{'','','','','','','','',''},...
    'FontSize',14,...
    'Position',[0.130357142857143 0.254071661237785 0.598545022938227 0.672118814952692]);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.03 0.97]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-2.3 2.3]);
box(axes1,'on');
hold(axes1,'on');

% Create ylabel
ylabel('log(I_1/I_2)');

% Create plot
plot(realPropDecrease(id),log(slope(id)),'Parent',axes1,'MarkerSize',3,'Marker','.','LineStyle','none',...
    'Color',[0 0 0]);


x=0:0.01:1;x;
y= 0.86711.*x.^2-2.3571.*x+1.5153;
hold on;
plot(x,y,'-p','LineWidth',2);

% Create axes
axes2 = axes('Parent',figure1,'XTickLabel',{'','','','','','','','',''},...
    'CLim',[1 2],...
    'XDir','reverse',...
    'FontSize',14,...
    'Position',[0.742079227797988 0.255118060212635 0.163505237874172 0.671090670425564]);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes2,[-2.3 2.3]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes2,[0 650]);
view(axes2,[90 90]);
box(axes2,'on');
hold(axes2,'on');

% Create ylabel
ylabel('Fequency');

% Create patch
hist(log(slope(id)),1000,'Parent',axes2);

% Create axes
axes3 = axes('Parent',figure1,'FontSize',14,...
    'Position',[0.131785714285714 0.0904761904761905 0.596785714285714 0.133333333333334]);
box(axes3,'on');
hold(axes3,'on');

% Create xlabel
xlabel('Decrease proportion in reservoir species richness');


xVec=linspace(0,1,20);
yVec=zeros(20,1);
for i=1:(length(xVec)-1)
    yVec(i)=mean(slope(find(slope>0.1 & slope<10 & realPropDecrease>xVec(i) & realPropDecrease<=xVec(i+1))));
end

plot(xVec,yVec,'Parent',axes3,'LineWidth',2,'Color',[0 0 0]);

[length(find(slope(id)<1)) length(find(slope(id)>1))]


%%%%%%%%%%%% Figure 3 %%%%%%%%%%%%

%slope=slope(find(nbSpeciesR1~=nbSpeciesR2));
realPropDecrease=nbSpeciesR2./nbSpeciesR1;
index=1:length(realPropDecrease);
%propDecreaseVec=propDecreaseVec(find(nbSpeciesR1>3 & nbSpeciesR2>3));
id=find(slope>0.1 & slope<10 & index>400000);

figure1=figure(2);
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.0879541108986616 0.59890216579537 0.837045889101335]);
box(axes1,'on');
hold(axes1,'on');
plot(realPropDecrease(id),log(slope(id)),'Parent',axes1,'MarkerSize',3,'Marker','.','LineStyle','none',...
    'Color',[0 0 0]);
%plot(unique(realPropDecrease),-8.461*unique(propDecreaseVec)+7.0199,'-r','LineWidth',3)

axes2 = axes('Parent',figure1,'XTickLabel',{'','','','','','','','',''},...
    'CLim',[1 2],...
    'XDir','reverse',...
    'Position',[0.76250933532487 0.09062294620612 0.163505237874172 0.829071126451622]);
view(axes2,[90 90]);
box(axes2,'on');
hold(axes2,'on');
hist(log(slope(id)),1000);
hold on
plot([0 0],[0 2500],'--k','linewidth',3)
[length(find(slope(id)<1)) length(find(slope(id)>1))]


realvartau=varTauR1(find(index>400000 & slope>0.1 & slope<10));
slopeToStudy=slope(find(index>400000 & slope>0.1 & slope<10));
xVec=linspace(0,max(realvartau),20);
yVec=zeros(20,1);
for i=1:(length(xVec)-1)
    yVec(i)=mean(slopeToStudy(find(realvartau>xVec(i) & realvartau<=xVec(i+1))));
end

figure(3)
plot(xVec,yVec);

%%%%%%%%%%%% Figure 2 %%%%%%%%%%%%
%figure2=figure(2);
