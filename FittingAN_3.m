
% N - number of cells in the theoratical colony
% set - indicates the data you want to fit ( which dataset out of the nms2 data
% set you want to fit, e.g., set = 1 will use the data of the nms{1} as the
% source of the experfrac

function [B, J, chinew,finfr,alpha,C,k] = FittingAN_3(N,K,chithresh,fixparam,choosebmp,param1)

clear Jnew
clear Bnew
clear alphanew
clear knew
clear Cnew

% load('datatofit_fig2.mat','tofit1_cdx2');
% experfrac  = tofit1_cdx2(1:7)';
%load('datatofitMEKiand control.mat','r');
%experfrac  = r{1}(1:7)';
load('Allcdx2fractions.mat','cdx2fr','cdx2err');
load('Allsox2fractions.mat','sox2fr','sox2err');

bmp1 = (1:7);% number of datasets
bmp2 = [0 0.1 0.3 1 3 10 30];
experfrac = cdx2fr{bmp1(choosebmp)}(1:N)';
err = cdx2err{bmp1(choosebmp)}(1:N)';
experfrac = sox2fr{bmp1(choosebmp)}(1:N)';
err = sox2err{bmp1(choosebmp)}(1:N)';
Jnew = rand;
% Bnew = rand;
alphanew = rand;
knew = rand;
Cnew = rand;

if fixparam ==1
    %Jnew =0; %set, if the J parameter is fixed
     Bnew = 1.26 ;% 1.26   0.23
end
Bnew = Cnew+((alphanew*bmp2(choosebmp))./(bmp2(choosebmp)+knew));
currfrac = FractionsN_AN(N,Bnew,Jnew);
if choosebmp >=2
        currfrac = 1-currfrac;
    end
currchi = sum((currfrac-experfrac).*(currfrac-experfrac));
for j=1:K    
    alpha = alphanew + (0.1*(2*rand-1));
    k = knew + (0.1*(2*rand-1));    
    C = Cnew + (0.1*(2*rand-1));
    Bnew = C+((alpha*bmp2(choosebmp))./(bmp2(choosebmp)+k));
    
%     B = Bnew + 0.01*(2*rand-1);
    J = abs(Jnew + 0.01*(2*rand-1));    % comment out when the J fixed
    if fixparam ==0
       % B = Bnew + 0.01*(2*rand-1);          % comment out when the B fixed
        B = Bnew;
    end
    if fixparam == 1
        B = Bnew;  % if  B fixed
       % J = Jnew;  % set when the J parameter is fixed
    end    
    finfr = FractionsN_AN(N,B,J);
    if choosebmp >=2   % <=2
        finfr = 1-finfr;
    end
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
        figure(choosebmp); errorbar(experfrac,err,'b.','Markersize',20,'LineWidth',2); %legend(nms2{set});
        hold on
        figure(choosebmp),plot(finfr,'--.','color','m','LineWidth',2);
        h = figure(choosebmp);
        h.CurrentAxes.FontSize = 15;
        h.CurrentAxes.LineWidth = 2;
        xlabel('Number of cells in the colony');
        ylabel(['FractionOf',(param1),'PositiveCells']);
        title ([ 'B value ' num2str(B) ', J value  ' num2str(J) ]);
        xlim([0 (N+1)]);
        ylim([0 1]);
        break;
    end
    if (j == K) && (chinew < chithresh) == 0
    B=0;
    J=0;
    chinew=0;
    finfr=zeros(1,size(bmp1,2));
    alpha=0;
    C=0;
    k=0;
    end
end
end



