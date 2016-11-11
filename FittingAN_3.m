
% N - number of cells in the theoratical colony
% set - indicates the data you want to fit ( which dataset out of the nms2 data
% set you want to fit, e.g., set = 1 will use the data of the nms{1} as the
% source of the experfrac

function [B, J, chinew,finfr] = FittingAN_3(N,K,chithresh,fixparam)

param1 = 'Cdx2';% placeholder
clear Jnew
clear Bnew
%load('datatofit_fig2.mat','tofitC_cdx2');
load('datatofitMEKiand control.mat','r');
experfrac  = r{2}(1:7)';
Jnew = rand;
Bnew = rand;
alphanew = rand;
knew = rand;
Cnew = rand;
colormap = prism;
if fixparam ==1
    %Jnew = 0.54; %0.922 set, if the J parameter is fixed
    Bnew = 1.4;
end
currfrac = FractionsN_AN(N,Bnew,Jnew);
currchi = sum((currfrac-experfrac).*(currfrac-experfrac));
for j=1:K
    
    
    J = abs(Jnew + 0.01*(2*rand-1));    % comment out when the J fixed
    if fixparam ==0
        B = Bnew + 0.01*(2*rand-1);          % comment out when the B fixed
    end
    if fixparam == 1
        B = Bnew;  % if  B fixed
    end
    %J = Jnew;  % set when the J parameter is fixed
    finfr = FractionsN_AN(N,B,J);
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
        figure(3); plot(experfrac,'b*','Markersize',20,'LineWidth',2); %legend(nms2{set});
        hold on
        figure(3),plot(finfr,'--*','color','m','LineWidth',2);
        h = figure(3);
        h.CurrentAxes.FontSize = 15;
        h.CurrentAxes.LineWidth = 2;
        xlabel('Number of cells in the colony');
        ylabel(['FractionOf',(param1),'PositiveCells']);
        title ([ 'B value ' num2str(B) ', J value  ' num2str(J) ]);
        xlim([0 (N+1)]);
        ylim([0 1]);
        break;
    end
    chinew;
end
end



