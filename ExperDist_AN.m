
function [binN, totalcoloniesN, np] = ExperDist_AN(nms,thresh,nms2,index,value,B,J,N)

%-------------------------

[np]= PartitionFn_AN(N,B,J);
% [np] = ThreeStatePartitionFuction_AN(N,B,J)
vect=1:N+1;
plot(vect,np,'m--*'); legend('Calculated values');hold on % plot normalized probabilities
ylim([0 1.1]);
xlim([0 N+1]);
hold on
%------------------------

%   %function [ratios, ratios2, totalcells] = ColAnalysisNoutfiles(Nplot,nms,thresh,nms2,index,value)
for k=1:size(nms,2)
    
    filename{k} = ['.' filesep  nms{k} '.mat'];
    
    load(filename{k},'peaks','dims','plate1');
    colonies{k} = plate1.colonies;
    if ~exist('plate1','var')
        [colonies{k}, ~]=peaksToColonies(filename);
    end
    M(k) = max([colonies{k}.ncells]);
    
    % [toplot,peaks] = GetSeparateQuadrantImgNumbersAN(nms2,peaks,dims,midcoord,fincoord);
end
M = max(M);

% obtaine experimental distributions ( within the colony size N)

for k=1:size(nms,2)
    
    totalcolonies = zeros(N+1,1);
    binN = zeros(N+1,1);
    totalcells=zeros(N+1,1);
    col = colonies{k};
    % nc=0;
    for ii=1:length(col)
        nc = col(ii).ncells;
        if ~isempty(col(ii).ncells) && nc == N;
            
            totalcolonies(nc)=totalcolonies(nc)+1;
            % totalcells(nc)=totalcells(nc)+nc;
            X = col(ii).data(:,value)./col(ii).data(:,5)>thresh;
            j = sum(X);
            binN(j+1)=binN(j+1)+1; % binN(j+1) contains the number of colonies, within which only j cells (out of N total cell within the colony) are gene-positive
            
        end
    end
    %
    for l=1:length(totalcolonies)
        
        totalcells(l)=totalcolonies(l)*l;
    end
    % need to normalize to the sum of colonies with N cells ( the
    % overall total number of N-cell colonies)
    
    totalcoloniesN = nonzeros(totalcolonies);
    allcells = sum(totalcells);
    
    binN = binN/totalcoloniesN;
    
    plot(binN,'b*');
    xlim([0 N+1]);
    
    xlabel('Number of cells in the colony');
    ylabel(['Probability',(index)]);
    
    
end
end