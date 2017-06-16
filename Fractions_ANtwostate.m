
function [fr] = Fractions_ANtwostate(N,B,J)
% calculates the expectation value of the fraction of "spin up" cells (
% those of which there are n within the colony N
np = PartitionFn_AN(N,B,J); %  np is an (nxm) matrix for a given row with n, the values (n,m1),(n,m2)...
%  correspond to probabilities
%   of observing n with the corresponding m(i).
% if sum up along the second dimention will get the column vector with necessary weights for each possible n, which can be used to calculate the expectation value below
fr=0;
for n=0:N
    expect(n+1) = ((n)/N)*np(n+1);
end
fr = sum(expect);
% fr = sum(fr);
end

