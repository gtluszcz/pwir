-module(zad).
-compile([export_all]).
-vsn(1.0).

% funkcje

len([]) -> 0;
len([_|T]) -> 1 + len(T). 


amin([E|C]) -> amin(C,E).
amin([E|C], M) when E<M -> amin(C, E);
amin([E|C], M) when E>=M -> amin(C, M);
amin([],M) -> M.

amax([E|C]) -> amax(C,E).
amax([E|C], M) when E>M -> amax(C, E);
amax([E|C], M) when E=<M -> amax(C, M);
amax([],M) -> M.

tmin_max(A) -> {amin(A),amax(A)}.
lmin_max(A) -> [amin(A),amax(A)].

pole({kwadrat,X,Y})-> X*Y;
pole({kolo,X}) -> 3.14*X*X.

lista_pol(A) -> lista_pol(A,[]).
lista_pol([],C) -> C;
lista_pol([A|B],C) -> lista_pol(B,[C|pole(A)]).
