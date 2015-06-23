function [B, J, chinew,finfr] = FittingFieldAN(N,K,chithresh,set,dp)
%-------------------------------

% dir2 = '/Users/warmflashlab/Desktop/A_NEMASHKALO_Data_and_stuff/2015-06-08-NoQuadrantsAtAll(Repeat)/RepeatOutallFiles';
% nms2 = {'Control'};
% nms  = { 'esi017noQd_10ng_Repeat'};
% %nms = {'esi017noqdratall_control(cdx2)'};
% %set = 1;
% thresh = 1.3; % 2
% index1 = [6 5];
% param1 = 'Cdx2';
% plottype = 0;
% flag = 0;
% 
% [x] = GetDataToFit_AN(N,thresh,nms,nms2,dir2,[],[],index1,param1,plottype,flag);
% 
% experfrac = x{set};
%-----------------------------
% use manually input data to fit

%   cdx2 =    [0.3425   0.8945   0.7589   1.3524  1.3258  1.2087  1.2272 ];
%
%   sox2 = [ 2.4465  1.1585    0.2829    0.1560   0.1431    0.1272  0.1491];
expermean = [0.3425;   0.8945;   0.7589;   1.3524;  1.3258;  1.2087;  1.2272 ]';
experfrac = expermean;

sizd = 1/(N); % or sizd

for j=1:dp % dp = umber of datapoints, in this case 7
    Jnew = rand;
    Bnew = rand;
    finfr = Fractions_AN(N,Bnew,Jnew);
    
    for i=1:N
        
        calcmean(i) = sizd*Fractions_AN(i,Bnew,Jnew); % finfr = fraction obtained as the expectation value of the number of Cdx2 positive cells this is a single number.
    end
    calcmean(j) = sum(calcmean); % this is the theoretical value for the expermean; each iteration j one value is obtained
    end
%calcmean; % after exiting the j loop calcmean is the vector of lenght 'dp'
%which contains the values to be compared to the experimental ones
currfrac = calcmean;

currchi = sum((currfrac-experfrac).*(currfrac-experfrac));
% now need to vary parameters B and J to fit to the
% values of the expermean. Also need to find J once and then  keep is
% the same, if possible.
for j=1:K
    
    %     if mod(j,100)==0
    %         disp([j currchi]);
    %     end
    
    J = abs(Jnew + 0.01*(2*rand-1)); % comment out when the J parameter is
    %  fixed
    B = Bnew + 0.01*(2*rand-1);
    %J = Jnew;% use when the J parameter is fixed
    finfr = Fractions_AN(N,B,J);
    
    for i=1:N
        
        calcmean(i) = sizd(i)*finfr; % finfr = fraction obtained as the expectation value of the number of Cdx2 positive cells this is a single number.
    end
    calcmean(j) = sum(calcmean); % this is the theoretical value for the expermean; each iteration j one value is obtained
    
end
%calcmean; % after exiting the j loop calcmean is the vector of lenght 'dp'
%which contains the values to be compared to the experimental ones
currfrac = calcmean;
chinew=sum((finfr-experfrac).*(finfr-experfrac));
%disp([chinew currchi]);

if chinew < currchi
    %disp('Here');
    
    Jnew = J;
    Bnew = B;
    
    currfrac = finfr; %Fractions_AN(N,Bnew,Jnew);
    currchi = chinew;
    
end

if  chinew < chithresh
    disp('Here');
    figure(3); plot(experfrac,'b*'); legend(nms2{set});
    hold on
    figure(3),plot(finfr,'r--*');
    
    xlabel('Number of cells in the colony');
    ylabel(['FractionOf',(param1),'PositiveCells']);
    title ([B,J]);
    xlim([0 (N+1)]);
    ylim([0 1.1]);
  %  break;
    
end
chinew;
end

