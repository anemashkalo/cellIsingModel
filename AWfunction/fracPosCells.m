function frac=fracPosCells(N,B,J)
prob=probabilityDistribution(N,B,J);
frac = sum((0:N)/N.*prob');