

% function to get the data to be feed into the fitting function
% needs to be supplied with the nms, nms2, thresh, index1, param1 and plottype
% these may be added to the arguments of the Fitting_3 function or
% specified manually within it


function [experfrac] = GetDataToFit_AN(N,thresh,nms,nms2,dir2,midcoord,fincoord,index1,param1,plottype,flag)


[~,ratios,~] = GeneralizedColonyAnalysisAN(thresh,dir2,nms,nms2,midcoord,fincoord,index1,param1,plottype,flag);
experfrac = [];

for k=1:size(ratios,2)
[r , ~] = find(isfinite(ratios{k}) == 1);

for i=1:N
    experfrac{k}(i) = ratios{k}(r(i));
end
end
end