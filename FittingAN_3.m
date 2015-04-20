function [param] = FittingAN_3(N,K)
experfrac = [0.539; 0.686; 0.667; 0.6547;  0.6881; 0.6864; 0.665; 0.733; 0.673;  0.7];

currfrac = zeros(1,N);
chithresh = 0.1;
index='cdx2';
thresh = 0.3;


Jnew = rand;
Bnew = rand;

currfrac = Fractions_AN(N,Bnew,Jnew);

for j=1:K
    
    J(j) = Jnew + 0.01*rand;
    B(j) = Bnew + 0.01*rand;
    
    finfr = Fractions_AN(N,B(j),J(j));
    
    for i=0:(N-1)
        chisq(i+1) = power(abs(currfrac(i+1) - experfrac(i+1)),2);
        chisqnew(i+1) = power(abs(finfr(i+1) - experfrac(i+1)),2);
    end
    
    chi(j) = sum(chisq);
    chinew(j) = sum(chisqnew); % sums of squared differences for each point
    
    if chinew(j) < chi(j) && chinew(j) > chithresh
        
        Jnew = J(j);
        Bnew = B(j);
        
        currfrac = Fractions_AN(N,Bnew,Jnew);
        
    else if chinew(j) > chi(j)
        Jnew = rand;
        Bnew = rand;
        currfrac = Fractions_AN(N,Bnew,Jnew);
        
    else if  chinew < chithresh
            
            figure(6); plot(experfrac,'b*'); %legend(nms2{k});
            hold on
            figure(6),plot(finfr,'r*');
            
            xlabel('Number of cells in the colony');
            ylabel(['FractionOf',(index),'PositiveCells']);
            % title ([thresh,B,J]);
            xlim([0 10]);
            ylim([0 1]);
        end
        end
    end
    param = chinew;
    
    
end



