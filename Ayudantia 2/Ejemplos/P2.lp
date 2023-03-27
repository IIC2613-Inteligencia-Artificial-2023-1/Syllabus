perro(p1).

gato(g1).

casa(c1).

habita(p1,c1).
habita(g1,c1).

vive_con(X,Y):-habita(X,C), habita(Y,C).

#show vive_con/2.