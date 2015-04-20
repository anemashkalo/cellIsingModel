function [B, J, chinew] = FittingAN_3(N,K)
experfrac = [0.539; 0.686; 0.667; 0.6547;  0.6881; 0.6864; 0.665; 0.733; 0.673;  0.7]';

chithresh = 0.1;
index='cdx2';
thresh = 0.3;


Jnew = rand;
Bnew = rand;

currfrac = FractionsN_AN(N,Bnew,Jnew);
currchi = sum((currfrac-experfrac).*(currfrac-experfrac));


for j=1:K
%     if mod(j,100)==0
%         disp([j currchi]);
%     end
    J = Jnew + 0.01*(2*rand-1);
    B = Bnew + 0.01*rand;%
    
    finfr = FractionsN_AN(N,B,J);
    chinew=sum((finfr-experfrac).*(finfr-experfrac));
  % disp([chinew currchi]);
    
    if chinew < currchi
        disp('Here');
        Jnew = J;
        Bnew = B;
        
        currfrac = finfr; %Fractions_AN(N,Bnew,Jnew);
        currchi = chinew;
   
    end    
   if  chinew < chithresh
            
            figure(6); plot(experfrac,'b*'); %legend(nms2{k});
            hold on
            figure(6),plot(finfr,'r*');
            
            xlabel('Number of cells in the colony');
            ylabel(['FractionOf',(index),'PositiveCells']);
            % title ([thresh,B,J]);
            xlim([0 10]);
            ylim([0 1]);

    end
     chinew;
end
    
end



