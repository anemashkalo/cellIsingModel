 %%
% calculate separatelythe peakstocolonies/or load the plate1 object from a
% matfile
%nms = {'esi017_30hr_1ng_repeat','esi017_42hr_1ng_repeat','esi017_30hr_10ng_repeat','esi017_42hr_10ng_repeat'};
nms = {'H2BoutallControlMM','H2Boutall01MM','H2Boutall1MM','H2Boutall10MM'};
%nms = {'outallcontrolH2BSignMM','outall01H2BSignMM','outall1H2BSignMM','outall10H2BSignMM'};
%nms = {'h2bsignS2_control_MM','h2bsignS2_01_MM','h2bsignS2_1_MM','h2bsignS2_10_MM'};outall_h2b_Segm2_AN
%nms = {'ESI049BMP4atControl','ESI049BMP4at01','ESI049BMP4at1','ESI049BMP4at10'};
% nms = {'outall_001_NEW','outall_01_NEW','outall_1_NEW','outall_10_NEW'};
% nms = {'ESI049FullCytoo'}
%nms2 = {'30 hr 1 ng/ml','42 hr 1 ng/ml','30 hr 10 ng/ml','42 hr 10 ng/ml'};
for k=1
   % colonies{k}=[];
    filename = ['.' filesep  nms{k} '.mat'];
   
    load(filename,'plate1');
   %load(filename);
   disp([filename,'plate1']);
   %disp(filename);
  % [colonies{k}, peaks]=peaksToColoniesSC(filename);
 colonies{k} = plate1.colonies;
    
    
end
%%
 %nms = {'H2BoutallControlMM','H2Boutall01MM','H2Boutall1MM','H2Boutall10MM'};
 %nms = {'outallcontrolH2BSignMM','outall01H2BSignMM','outall1H2BSignMM','outall10H2BSignMM'};
 nms = {'h2bsignS2_control_MM','h2bsignS2_01_MM','h2bsignS2_1_MM','h2bsignS2_10_MM'};
 %figure,  MeansFromQuadrantsOfFullChip(2,'esi017FullCytoo42hr',nms2,[20 19],[10 18], [19 18],[5],'cdx2/DAPI');%42

 [aver, error] = DirectMeanAN(nms,8);
%%

% fraction of cells that are sox17 positive vs nuber of cells in the colony
nms2 = {'H2BoutallControlMM','H2Boutall01MM','H2Boutall1MM','H2Boutall10MM'};
%nms2={'ESI049BMP4atControl','ESI049BMP4at01','ESI049BMP4at1','ESI049BMP4at10'};
%nms2 = {'Control','0.1 ng/ml BMP4','1 ng/ml BMP4','10 ng/ml BMP4'};
%nms2 = {'30 hr 1 ng/ml','42 hr 1 ng/ml','30 hr 10 ng/ml','42 hr 10 ng/ml'};
%for k=1:4
index='Eomes';
%threshold = '0.5';
for k=1
   
    totalcolonies = zeros(150,1);
    sox17positive = zeros(150,1);
    sox17colonies = zeros(150,1);
    rawdata = zeros(150,1);
    
    totalcells=zeros(150,1);
    thresh = 0.3; %aver{1} + error{1}*3
    col = colonies{k};
    %nc=0;
    for ii=1:length(col)
        if ~isempty(col(ii).ncells);
        nc = col(ii).ncells;
        
        totalcolonies(nc)=totalcolonies(nc)+1;
       % totalcells(nc)=totalcells(nc)+nc;
        tmp = col(ii).data(:,6)./col(ii).data(:,5) > thresh;
        
        sox17positive(nc)=sox17positive(nc)+sum(tmp);
        sox17colonies(nc)=sox17colonies(nc)+any(tmp);
        
        
        %currcells = col(ii).data(:,10)./col(ii).data(:,5);
%         for j=1:size(col(ii).data,1)
%          if (col(ii).data(j,10)./col(ii).data(j,5)) > thresh ;
%             sox17positive(nc)= sox17positive(nc)+1;
%          end  
%         end
       % ratios(nc)=sox17positive(nc)./(length(totalcolonies(nc))*nc);
        
        end
    end
%     
 for l=1:length(totalcolonies)
       
      totalcells(l)=totalcolonies(l)*l;
 end
    
 
    allcells = sum(totalcells);
    
    ratios = sox17positive./totalcells;
    ratios2 = sox17colonies./totalcolonies;
    
        
    %subplot(2,2,k), plot(sox17colonies,'b*');legend(nms2{k});hold on subplot(2,2,k)
    figure(6);subplot(2,2,k), plot(ratios,'b*'); legend(nms2{k});
    xlabel('Number of cells in the colony');
    ylabel(['FractionOf',(index),'PositiveCells']);
    title ([thresh]);
    xlim([0 10]);
    ylim([0 1]);
    
    
    
end