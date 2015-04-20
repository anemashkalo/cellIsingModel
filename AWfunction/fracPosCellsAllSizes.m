function frac=fracPosCellsAllSizes(B,J)

frac =zeros(20,1);

for ii = 1:20
    frac(ii)=fracPosCells(ii,B,J);
end