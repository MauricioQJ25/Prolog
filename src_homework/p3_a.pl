
% Regla que regresa True si N es el numero
% de elementos distintos en la lista Xs
cuenta(Xs,N):-
  sin_repetidos(Xs, R), longitud(R,N).

% Regla que checa el numero de elementos
% en una lista

% Caso base: lista vacia
longitud([],0).

% Caso iterativo: lista no vacia
longitud([H|T],L):-
  longitud_contador([H|T],0,L).

longitud_contador([_|T],I,L):-
  I1 is I+1,
  longitud_contador(T,I1,L).

longitud_contador([],I,I).

% Regla que regresa una lista sin elementos
% repetidos entre si

% Caso base: lista vacia
sin_repetidos([],[]).

% Caso iterativo: lista no vacia
sin_repetidos([H|T1],T2) :-
    member(H,T1),
    sin_repetidos(T1,T2).

sin_repetidos([H|T1], [H|T2]):-
    \+ member(H,T1),
    sin_repetidos(T1,T2).
