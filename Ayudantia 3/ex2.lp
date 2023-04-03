animal("perro").
animal("ornitorrinco").
animal("condor").

produce_leche("perro").
produce_leche("ornitorrinco").

pone_huevos("ornitorrinco").
pone_huevos("condor").

mamifero(P) :- produce_leche(P), animal(P).
otro(P) :- pone_huevos(P), not mamifero(P), animal(P).

mamifero(P, Q) :- produce_leche(P), animal(P), animal(Q).

#show mamifero/1.
#show otro/1.