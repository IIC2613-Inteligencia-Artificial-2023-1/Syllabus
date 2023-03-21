num(1..40).

compuesto(N) :- num(N), num(M), N>M, M>1, K=2..40, N=M*K.

#show compuesto/1.