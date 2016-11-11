function [B] = AnalyticalMean(conc,alpha,k)

B = alpha*(conc)/(k+conc);
end