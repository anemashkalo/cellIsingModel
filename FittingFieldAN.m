function [alpha, k, chinew,calcmean] = FittingFieldAN(K,chithresh,set,dp)
%-------------------------------

% dir2 = '/Users/warmflashlab/Desktop/A_NEMASHKALO_Data_and_stuff/2015-06-08-NoQuadrantsAtAll(Repeat)/RepeatOutallFiles';
% nms2 = {'Control'};
% nms  = { 'esi017noQd_10ng_Repeat'};
% %nms = {'esi017noqdratall_control(cdx2)'};
% %set = 1;
% thresh = 1.3; % 2
% index1 = [6 5];
 param1 = 'Cdx2';
% plottype = 0;
% flag = 0;
% 
% [x] = GetDataToFit_AN(N,thresh,nms,nms2,dir2,[],[],index1,param1,plottype,flag);
% 
% experfrac = x{set};
%-----------------------------
%  %  
% use manually input data to fit
%   cdx2 =    [0.3425   0.8945   0.7589   1.3524  1.3258  1.2087  1.2272 ];
%   sox2 = [ 2.4465  1.1585    0.2829    0.1560   0.1431    0.1272  0.1491];
expermean = [2.4465;  1.1585;    0.2829;    0.1560;   0.1431;    0.1272;  0.1491 ]';
%expermean = [0.3425;   0.8945;  1.3524;  1.3258;  1.2087;  1.2272 ]';%0.7589;removed the value at 0.3 ng/ml concentration
experfrac = expermean;

%sizd = 1/(N); % or sizd

% dp = number of datapoints, in this case 7
    alphanew = (rand);
    knew = (rand);
    %finfr = Fractions_AN(N,Bnew,Jnew);
    conc = [0.01 0.1 0.3 1 3 10 30];% removed the value at 0.3 ng/ml concentration
    for i=1:dp
        
        calcmean(i) = AnalyticalMean(conc(i),alphanew,knew);
       % calcmean(i) = (1/i)*Fractions_AN(i,Bnew,Jnew); % finfr = fraction obtained as the expectation value of the number of Cdx2 positive cells this is a single number.
    end
   %calcmean;  is the vector of lenght 'dp'
   %which contains the values to be compared to the experimental ones
currfrac = calcmean;
currchi = sum((currfrac-experfrac).*(currfrac-experfrac)); 
for xx=1:K     
    %     if mod(j,100)==0
    %         disp([j currchi]);
    %     end    
    alpha = (alphanew + 0.01*(2*rand-1));
    k = (knew + 0.01*(2*rand-1));
    %k = -(knew + 0.01*(2*rand-1));
    
%     J = abs(Jnew + 0.01*(2*rand-1)); % comment out when the J parameter is
%     %  fixed
%     B(j) = Bnew + 0.01*(2*rand-1);
%     %finfr = Fractions_AN(N,B,J);
    
    for i=1:dp
         calcmean(i) = AnalyticalMean(conc(i),alpha,k);
        %calcmean(i) = (1/i)*Fractions_AN(i,B(j),J); % finfr = fraction obtained as the expectation value of the number of Cdx2 positive cells this is a single number.
    end
    %calcmean(j) = sum(calcmean); % this is the theoretical value for the expermean; each iteration j one value is obtained
    
currfrac = calcmean;
chinew=sum((calcmean-experfrac).*(calcmean-experfrac));
%disp([chinew currchi]);
if chinew < currchi
    %disp('Here');    
    alphanew = alpha;
    knew = k;
    for i=1:dp
         calcmean(i) = AnalyticalMean(conc(i),alpha,k);
    end
    currfrac = calcmean; %finfr Fractions_AN(N,Bnew,Jnew);
    currchi = chinew;    
end
if  chinew < chithresh   
    disp('Here');
    figure(3); plot(conc,experfrac,'b*'); %legend(nms2{set});
    hold on
    figure(3),plot(conc,calcmean,'r--*');    
    xlabel('Experimental Concentration of BMP4');
    ylabel(['Mean',(param1),'value']);
    title ([alpha,k]);
     xlim([-1 32]);
%     ylim([0 1.1]);
   break;
    
end
chinew;
end
end

