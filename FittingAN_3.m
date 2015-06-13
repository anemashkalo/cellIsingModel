
% N - number of cells in the theoratical colony
% set - indicates the data you want to fit ( which dataset out of the nms2 data
% set you want to fit, e.g., set = 1 will use the data of the nms{1} as the
% source of the experfrac

function [B, J, chinew] = FittingAN_3(N,K,chithresh,set)
%-------------------------------

  nms = { 'esi017noqdratall_control(2)','esi017noqdratall_control(cdx2)','esi017noqdratall_1ngmlBMP','esi017noqdratall_10ngmlBMP'};
   nms2 = {'control(2) ','control(1) ','1 ng/ml ','10 ng/ml'};   
     
  thresh = 0.5;
  index1 = [6 5];
  param1 = 'CY5';
  plottype = 0;
  flag = 0;     
  

 [x] = GetDataToFit_AN(N,thresh,nms,nms2,[],[],index1,param1,plottype,flag);

experfrac = x{set}; 
  
%-------------------------------

 %experfrac = [0.539; 0.686; 0.667; 0.6547;  0.6881; 0.6864; 0.665; 0.733; 0.673;  0.7]';% cdx2positive, 10ng/ml
%experfrac =  [0.07; 0.039; 0.029; 0.015; 0.009; 0.005; 0.006; 0.017; 0; 0]';% cdx2positive, control
%experfrac =  [0.181; 0.168; 0.210; 0.158; 0.151; 0.131; 0.129; 0.118; 0.117; 0.128 ]';% Sox2positive,1 ng.ml
%experfrac =  [0.870; 0.935; 0.978; 0.979; 0.973; 0.982; 0.972; 0.971; 0.978; 1]';% Sox2positive, control
%experfrac =  [0.043; 0.056; 0.044; 0.061; 0.039; 0.027; 0.033; 0.014; 0.027; 0.006]';% Sox2positive, 10ng/ml

%experfrac =  [0.176;0.183;0.134;0.173;0.126;0.137;0.134;0.142;0.071;0.039]';% cdx2positive, 1 ng/ml
%experfrac =  [0.036;0.016;0.022;0.0043;0.0041;0.003;0.005;0.0012;0.0079;0.0036]';% cdx2positive, 0.1 ng/ml
%experfrac =  [0.418; 0.575; 0.570; 0.584;0.583; 0.575; 0.509; 0.539; 0.533; 0.426]';% Sox2positive, 0.1 ng/ml
%experfrac =  [0.073; 0.072; 0.066; 0.051; 0.038; 0.023; 0.040; 0; 0 ]';% cdx2positive colonies, 10 ng/ml
%-------------------------------------

 Jnew = rand;
 Bnew = rand;

 %Jn = 0.889994;

currfrac = FractionsN_AN(N,Bnew,Jnew);
currchi = sum((currfrac-experfrac).*(currfrac-experfrac));  

for j=1:K
    
%     if mod(j,100)==0
%         disp([j currchi]);
%     end

   J = abs(Jnew + 0.01*(2*rand-1)); 
   B = Bnew + 0.01*(2*rand-1);
    
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
            figure(3); plot(experfrac,'b*'); legend(nms2{set});
            hold on
            figure(3),plot(finfr,'r--*');
          
            xlabel('Number of cells in the colony');
            ylabel(['FractionOf',(param1),'PositiveCells']);
            title ([B,J]);
            xlim([0 (N+1)]);
            ylim([0 1.1]);
            break;

    end
     chinew;
end
    
end



