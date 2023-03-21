ciudad(austin).
ciudad(dallas).
ciudad(houston).
ciudad(santonio).

temp_ciudad(88, austin).
temp_ciudad(95, dallas).
temp_ciudad(90, houston).
temp_ciudad(85, santonio).

calurosa(X) :- temp_ciudad(T1, X), temp_ciudad(T2, austin), T1>T2, ciudad(X).
calurosa(hola, si).
#show calurosa/1.