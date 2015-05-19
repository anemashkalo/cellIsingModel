
%
%the B and J parameters were obtained from the fitting the raw data for the
%cdx2 positive cells using the probability and fractions for the n of cdx2
%positive cells ( spin up particles fractions)
% this script uses the same parameters ( B and J, since they cannot change
% depending on what quantities we are looking at) to plot the fractions of
% cdx2 negative, i.e. sox2 positive cells  ( in this case the two state model is assumed)

%experfrac =  [0.870; 0.935; 0.978; 0.979; 0.973; 0.982; 0.972; 0.971; 0.978; 1]';% Sox2positive, control
%experfrac =  [0.043; 0.056; 0.044; 0.061; 0.039; 0.027; 0.033; 0.014; 0.027; 0.006]';% Sox2positive, 10ng/ml
%experfrac =  [0.418; 0.575; 0.570; 0.584;0.583; 0.575; 0.509; 0.539; 0.533; 0.426]';% Sox2positive, 0.1 ng/ml
%experfrac =  [0.181; 0.168; 0.210; 0.158; 0.151; 0.131; 0.129; 0.118; 0.117; 0.128 ]';% Sox2positive,1 ng.ml
experfrac =  [0.073; 0.072; 0.066; 0.051; 0.038; 0.023; 0.040; 0; 0 ]';% cdx2positive colonies, 10 ng/ml

index='Cdx2';
index2='CONTROL';

B = -1.253;% 1 parameters
J = 0.337;

finfr = 1-FractionsN_AN(10,B,J);
figure, plot(finfr,'r--*'); % calculated fit
hold on
plot(experfrac,'b*');
xlim([0 10]);
title ([B,J]);

xlabel('Number of cells in the colony');
ylabel(['FractionOf    ',(index),'    PositiveCells    ',(index2),]);

%%
%plot parameters from the fit ( external field and interaction constant)
B = [-1.253; -1.602; -0.696; 0.0585];% (control 0.1 1 10)
J = [ 0.337; 0.391; 0.0756; 0.8899];%(control 0.1 1 10)

%these are parameters from the free fit of the sox2 data
B = [0.971;0.014; -0.153; -1.301];% (control 0.1 1 10)
J = [0.396; 0.507; 0.865; 0.221];%(control 0.1 1 10)

nms2 = {'control','0.1 ng/ml BMP4','1 ng/ml BMP4','10 ng/ml BMP4'};

figure, plot(B,'b*');
title('External field = Bmp4 level');
ylabel('B value from the fit');
set(gca,'Xtick',1:4);%
set(gca,'Xticklabel',nms2);

figure, plot(J,'m*');
title('Interaction');
ylabel('J value from the fit');
set(gca,'Xtick',1:4);%
set(gca,'Xticklabel',nms2);

%%

% averages from dynamics data 

Cdx21 = [0.198;0.242;0.87;0.51;1.25];
Eomes1  = [ 1.01;1.87;2.37;1.34;1.38];
Sox171  = [ 0.32;0.44;2.6;0.39;0.37];

Cdx210 = [0.677;1.67;0.97;0.39;0.45];
Eomes10  = [ 1.04;0.93;1.2;0.85;1.53];
Sox1710  = [ 0.83;2.64;1.94;0.56;2.4];


nms1 = {'30 hr','42 hr','51 hr','60 hr','72 hr'};


figure(1),subplot(2,2,1), plot (Cdx21,'b*');ylabel('Cdx2/dapi');title('BMP4 at 1 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);
ylim([0 3]);

figure(1),subplot(2,2,2), plot (Eomes1,'r*');ylabel('Eomes/dapi');title('BMP4 at 1 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);ylim([0 3]);
figure(1),subplot(2,2,3), plot (Sox171,'m*');ylabel('Sox17/dapi');title('BMP4 at 1 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);ylim([0 3]);


figure(2),subplot(2,2,1), plot (Cdx210,'b*');ylabel('Cdx2/dapi');title('BMP4 at 10 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);ylim([0 3]);
figure(2),subplot(2,2,2), plot (Eomes10,'r*');ylabel('Eomes/dapi');title('BMP4 at 10 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);ylim([0 3]);
figure(2),subplot(2,2,3), plot (Sox1710,'m*');ylabel('Sox17/dapi');title('BMP4 at 10 ng/ml, ESI017 cells');
set(gca,'Xtick',1:5);%
set(gca,'Xticklabel',nms1);ylim([0 3]);

