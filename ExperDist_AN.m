
function [binN, totalcoloniesN, pp] = ExperDist_AN(dir,nms,thresh,nms2,param1,index,B,J,N,flag)
% calculate experiemnta distribution of gene positive cells within the
% colonies of specific size N
clear binN
clear X
clear j
binN = cell(1,size(nms,2));
%-------------------------
% get theor distributions
[np]= PartitionFn_AN(N,B,J); % for two-state    
 pp = np';
%  [np] = ThreeStatePartitionFn_AN(N,B,J); % for three state
%  pp = sum(np,2);
vect=0:N;
if flag == 1
plot(vect,pp,'m--*'); legend('Calculated values');hold on % plot normalized probabilities
ylim([0 1.1]);
xlim([0 N+1]);
%hold on
end
%------------------------
%
for k=1:size(nms,2)    
    filename{k} = [dir filesep  nms{k} '.mat'];
    disp(filename{k});
    load(filename{k},'peaks','dims','plate1');
    colonies{k} = plate1.colonies;
    if ~exist('plate1','var')
        [colonies{k}, ~]=peaksToColonies(filename);
    end
    M(k) = max([colonies{k}.ncells]);   
end
M = max(M);
% obtain experimental distributions ( within the colony size N)
for k=1:size(nms,2)    
    totalcolonies = zeros(N+1,1);
    binN{k} = zeros(N+1,1);
    totalcells=zeros(N+1,1);
    col = colonies{k};
    % nc=0;
    for ii=1:length(col)
        nc = col(ii).ncells;
        if ~isempty(col(ii).ncells) && nc == N;            
            totalcolonies(nc)=totalcolonies(nc)+1;
            % totalcells(nc)=totalcells(nc)+nc;
            X = col(ii).data(:,index)./col(ii).data(:,5)>thresh;
            j = sum(X);
            binN{k}(j+1)=binN{k}(j+1)+1; % binN(j+1) contains the number of colonies, within which only j cells (out of N total cell within the colony) are gene-positive            
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
    binN{k} = binN{k}/totalcoloniesN;
    if flag == 1
    plot(vect,binN,'b*'); legend(nms2);
    xlim([0 N+1]);
    xlabel('Number of cells in the colony');
    ylabel(['Probability',(param1)]);
    end
    
end
end