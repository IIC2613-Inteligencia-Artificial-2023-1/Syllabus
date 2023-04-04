% Definimos cada una de las ampolletas (sería más eficiente definirlas con números en vez de strings)
ampolleta("uno").
ampolleta("dos").
ampolleta("tres").
ampolleta("cuatro").
ampolleta("cinco").
ampolleta("seis").
ampolleta("siete").
ampolleta("ocho").

% Definimos la relación de que una ampolleta se encuentre junto a otra (seguidas(X, X + 1) :- X < 8, ampolleta(X). si trabajamos con números)
seguidas("uno", "dos").
seguidas("dos", "tres").
seguidas("tres", "cuatro").
seguidas("cuatro", "cinco").
seguidas("cinco", "seis").
seguidas("seis", "siete").
seguidas("siete", "ocho").

% En todo momento hay un tiempo distinto
1 {tiempo_actual("dia"); tiempo_actual("tarde"); tiempo_actual("noche")} 1.

% Encendemos a todas la ampolletas que cumplan su regla
encendida(X) :- regla(X), ampolleta(X).

% La primera ampolleta se prende solo si no es de dia
regla("uno") :- not tiempo_actual("dia").

% La segunda ampolleta se prende solo si la 4ta ampolleta esta encendida
regla("dos") :- encendida("cuatro").

% La tercera ampolleta se prende solo si es de noche Y la quinta ampolleta está encendida
regla("tres") :- tiempo_actual("noche"), encendida("cinco").

% La cuarta ampolleta se prende si algún par de ampolleta consecutivo están apagadas O si no es de noche
% Dos ampolletas X, Y no deben encontrarse encendidas para que se cumpla el criterio
regla("cuatro") :- seguidas(X, Y), not encendida(X), not encendida(Y), ampolleta(X), ampolleta(Y).
regla("cuatro") :- not tiempo_actual("noche").

% La quinta ampolleta se prende si hay más de 3 ampolletas encendidas
% Usamos #count, seleccionando todas las variables X que cumplan que son ampolletas y están encendidas
regla("cinco") :- #count{ X: encendida(X), ampolleta(X) } > 3.

% La sexta ampolleta se prende si hay una ampolleta encendida y además enciende otra ampolleta que no cumpla su criterio
% En caso de que más de 0 ampolletas estén encendidas, seis cumple su regla
regla("seis") :- #count{ X: encendida(X), ampolleta(X) } > 0.
% Definimos una nueva relación para aquellas ampolletas que no cumplen su regla y seleccionamos a una de ellas para cumplirla. Luego, la encendemos
1 { criterio_seis(X): not regla(X), ampolleta(X) } 1.
encendida(X) :- criterio_seis(X).

% La séptima ampolleta se prende si hay al menos una ampolleta que no sea seguida a sí y que no cumpla su criterio
regla("siete") :- #count{ X: not regla(X), not seguida(X, "siete"), not seguida("siete", X), ampolleta(X), X != "siete" } > 0.

% La octava ampolleta se prende si la 1ra y la 3ra ampolleta tienen el mismo estado
% Este estado puede ser encendidas o apagadas
regla("ocho") :- encendida("uno"), encendida("tres").
regla("ocho") :- not encendida("uno"), not encendida("tres").

% Definimos la cantidad de ampolletas encendidas utilizando un count
cantidad_encendidas(C) :- C = #count{ X: encendida(X), ampolleta(X) }.

% Maximizamos el valor del count anterior en nuestras soluciones (optimizamos el problema para maximizar su valor)
#maximize{ C: cantidad_encendidas(C) }.

% En cada respuesta, mostramos solamente las preposiciones que consideramos relevantes: encendida(X) y cantidad_encendidas(C)
#show encendida/1.
#show cantidad_encendidas/1.