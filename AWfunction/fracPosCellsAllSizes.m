function frac=fracPosCellsAllSizes(B,J)

frac =zeros(20,1);

for ii = 1:10
    frac(ii)=fracPosCells(ii,B,J);
end