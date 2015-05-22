

% function to get the data to be feed into the fitting function
% needs to be supplied with the nms, nms2, thresh, index1, param1 and plottype
% these may be added to the arguments of the Fitting_3 function or
% specified manually within it


function [experfrac] = GetDataToFit_AN(N,thresh,nms,nms2,midcoord,fincoord,index1,param1,plottype)



[totalcells,ratios,ratios2] = GeneralizedColonyAnalysisAN(thresh,nms,nms2,midcoord,fincoord,index1,param1,plottype);

[r , ~] = find(isfinite(ratios) == 1);

experfrac = zeros(N,1);

for i=1:N
    experfrac(i) = ratios(r(i));
end
end