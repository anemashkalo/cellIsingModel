
function [binN, totalcoloniesN, np] = ExperDist_AN(Nplot,nms,thresh,nms2,index,value,B,J,N)

%-------------------------

[np]= PartitionFn_AN(N,B,J);

  vect=1:N+1;
  plot(vect,np,'m--*'); legend('Calculated values');hold on % plot normalized probabilities
  ylim([0 1.1]);
  xlim([0 N+1]);
  hold on
%------------------------
  
%   %function [ratios, ratios2, totalcells] = ColAnalysisNoutfiles(Nplot,nms,thresh,nms2,index,value) 
for k=1:Nplot
     % colonies{k}=[];
     filename = ['.' filesep  nms{k} '.mat'];
     load(filename);
%     
% %     load(filename,'plate1');
% %     disp([filename,'plate1']);
% %     colonies{k} = plate1.colonies;
%     
%    % if ~exist('plate1')
%         
%     load(filename);
     disp([filename]);
    [colonies{k}, peaks]=peaksToColoniesSC(filename);
     end
%     
% end

% fraction of cells that are sox17 positive vs nuber of cells in the colony

for k=1:Nplot
    
    totalcolonies = zeros(N+1,1);
    binN = zeros(N+1,1);
      
    totalcells=zeros(N+1,1);
    col = colonies{k};
    % nc=0;
    for ii=1:length(col)
        nc = col(ii).ncells;
        if ~isempty(col(ii).ncells) && nc == N;
            %nc = col(ii).ncells;
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
   % binN = nonzeros(binN); 
    binN = binN/totalcoloniesN;
   % binN = sort(binN,'descend');  % order of the plotted values  
    plot(binN,'b*');
    xlim([0 N+1]);
    
    xlabel('Number of cells in the colony');
    ylabel(['Probability       ',(index)]);
    
%     ratios = genepositive./totalcells;
%     ratios2 = geneposcolonies./totalcolonies;
     
%------------------------------------------------------------------------------------------    
    %subplot(2,2,k), plot(sox17colonies,'b*');legend(nms2{k});hold on subplot(2,2,k)
%     figure(6);subplot(2,2,k), plot(ratios,'b*'); legend(nms2{k});
%     xlabel('Number of cells in the colony');
%     ylabel(['FractionOf',(index),'PositiveCells']);
%     title ([thresh]);
%     xlim([0 10]);
%     ylim([0 1]);
%     
%     figure(1);  subplot(2,2,k), plot(ratios2,'b*'); legend(nms2{k});
%     xlabel('Number of cells in the colony');
%     ylabel(['FractionOf',(index),'PositiveColonies']);
%     title ([thresh]);
%     xlim([0 10]);
%     ylim([0 1]);
%     
%     figure(4);  subplot(2,2,k), plot(totalcells,'b*'); legend(nms2{k});
%     xlabel('Number of cells in the colony');
%     ylabel('Total cells');
%     
%     title ([thresh]);
%     xlim([0 10]);
    
end
end