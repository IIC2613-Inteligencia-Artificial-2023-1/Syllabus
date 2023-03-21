dulce(1..5).

persona(p1 ; p2).

1{dulce_para(N, P) : dulce(N)}3 :- persona(P).

:- dulce_para(N, P1), dulce_para(N, P2), P1!=P2.