
function [Bnew, Jnew, chinew,finfr] = FittingAN_3(N,K,chithresh,fixparam,param1,set)

clear Jnew
clear Bnew
clear alphanew
clear knew
clear Cnew
clear currchi
clear alldat
clear alldatnobmp
clear Bnew
clear B
clear J
clear Jnew
load('bioreplicateserrors.mat');

a = -1;
b = 1;
nn = 1000;
rpool = a + (b-a)*rand(nn,1); % to plool from random numbers between a and b
load('bioreplicateserrors.mat','meanCsox2');%meanC_Cdx2   meanDcdx2  meanCsox2 meanDsox2
%load('Allcdx2fractions','cdx2fr');
alldat = cat(1,meanCsox2);% cdx2fr{set}
experfrac = alldat';
Jnew = rand;
Bnew = rpool(randi(nn));
if fixparam ==1
    %Jnew =0; %set, if the J parameter is fixed
     Bnew = 1.26 ;% 1.26   0.23
end
currfrac = FractionsN_AN(N,Bnew,Jnew);
currchi = sum((currfrac-experfrac).*(currfrac-experfrac));
for j=1:K            
    B = Bnew + 0.01*rpool(randi(nn));
    J = abs(Jnew + 0.01*(2*rand-1));    % comment out when the J fixed    
    if fixparam == 1
        B = Bnew;  % if  B fixed
       % J = Jnew;  % set when the J parameter is fixed
    end    
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
        figure(10); plot(experfrac,'b.','Markersize',20,'LineWidth',2); %legend(nms2{set});
        hold on
        figure(10),plot(finfr,'--.','color','m','LineWidth',2);
        h = figure(10);
        h.CurrentAxes.FontSize = 15;
        h.CurrentAxes.LineWidth = 2;
        xlabel('Number of cells in the colony');
        ylabel(['FractionOf',(param1),'PositiveCells']);
        title ([ 'B value ' num2str(Bnew) ', J value  ' num2str(Jnew) ]);
        xlim([0 (N+1)]);
        ylim([0 1]);
        break;
    end
    if (j == K) && (chinew < chithresh) == 0
    Bnew=0;
    Jnew=0;
    chinew=0;
    finfr=zeros(1,N);    
    end
end
end



