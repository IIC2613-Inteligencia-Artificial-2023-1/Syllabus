casa(h1).
casa(h2).
casa(h3).
casa(h4).

condominio(c1).
condominio(c2).

1{predicado(H, C): condominio(C)}1 :- casa(H).

#show predicado/2.