outdir = '/Users/aryeh/Dropbox/Writing/CommunityEffect/2017-06-19-Development-Revision/modelPanels';

N = 6;
B = 0; 

prob = zeros(6,7);

for ii = 0:0.2:1
    prob(round(5*ii+1),:) = probabilityDistribution(N,B,ii);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'J=0.0','J=0.2','J=0.4','J=0.6','J=0.8','J=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Jpanel_B0.eps'),'-transparent');

%%
N = 6;
B = 0.5; 

prob = zeros(6,7);

for ii = 0:0.2:1
    prob(round(5*ii+1),:) = probabilityDistribution(N,B,ii);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'J=0.0','J=0.2','J=0.4','J=0.6','J=0.8','J=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Jpanel_B0-5.eps'),'-transparent');
%%
N = 6;
B = -0.5; 

prob = zeros(6,7);

for ii = 0:0.2:1
    prob(round(5*ii+1),:) = probabilityDistribution(N,B,ii);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'J=0.0','J=0.2','J=0.4','J=0.6','J=0.8','J=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Jpanel_Bm0-5.eps'),'-transparent');
%%
N = 6;
J = 0; 

prob = zeros(6,7);

for ii = -1:0.4:1
    prob(round(2.5*(ii+1)+1),:) = probabilityDistribution(N,ii,J);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'B=-1','B=-0.6','B=-0.2','B=0.2','B=0.6','B=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Bpanel_J0.eps'),'-transparent');
%%
N = 6;
J = 0.3; 

prob = zeros(6,7);

for ii = -1:0.4:1
    prob(round(2.5*(ii+1)+1),:) = probabilityDistribution(N,ii,J);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'B=-1','B=-0.6','B=-0.2','B=0.2','B=0.6','B=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Bpanel_J0-3.eps'),'-transparent');
%%
N = 6;
J = 0.1; 

prob = zeros(6,7);

for ii = -1:0.4:1
    prob(round(2.5*(ii+1)+1),:) = probabilityDistribution(N,ii,J);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'B=-1','B=-0.6','B=-0.2','B=0.2','B=0.6','B=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Bpanel_J0-1.eps'),'-transparent');
%%
N = 6;
J = 1; 

prob = zeros(6,7);

for ii = -1:0.4:1
    prob(round(2.5*(ii+1)+1),:) = probabilityDistribution(N,ii,J);
end

plot(0:6,prob','LineWidth',2);
xlabel('Number of CDX2+ cells');
ylabel('Frequency');
set(gca,'FontSize',22);
legend({'B=-1','B=-0.6','B=-0.2','B=0.2','B=0.6','B=1.0'},'FontSize',18,'Location','Best');
export_fig(fullfile(outdir,'Bpanel_J1.eps'),'-transparent');
%%
B = 0.1;
J = 0.1; 
for N = 3:3:21
    ind = round(1/3*N);
    probc{ind} = probabilityDistribution(N,ii,J);
    allcdx(ind) = probc{ind}(end);
end

plot(3:3:21,allcdx,'LineWidth',2);
xlabel('Colony Size');
ylabel('Fraction of colonies completely CDX2+');
set(gca,'FontSize',22);
xlim([3 21])
export_fig(fullfile(outdir,'Npanel_B0-1_J0-1.eps'),'-transparent');
%%
B = 0.1;
J = 0.0; 
for N = 3:3:21
    ind = round(1/3*N);
    probc{ind} = probabilityDistribution(N,ii,J);
    allcdx(ind) = probc{ind}(end);
end

plot(3:3:21,allcdx,'LineWidth',2);
xlabel('Colony Size');
ylabel('Fraction of colonies completely CDX2+');
set(gca,'FontSize',22);
xlim([3 21])
export_fig(fullfile(outdir,'Npanel_B0-1_J0.eps'),'-transparent');
%%
B = 0.1;
J = 1; 
for N = 3:3:21
    ind = round(1/3*N);
    probc{ind} = probabilityDistribution(N,ii,J);
    allcdx(ind) = probc{ind}(end);
end

plot(3:3:21,allcdx,'LineWidth',2);
xlabel('Colony Size');
ylabel('Fraction of colonies completely CDX2+');
set(gca,'FontSize',22);
xlim([3 21])
export_fig(fullfile(outdir,'Npanel_B0-1_J1.eps'),'-transparent');
