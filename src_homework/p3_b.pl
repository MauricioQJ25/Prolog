% Regla que elimina de la lista Xs
% los elementos repetidos, y
% obtiene una lista nueva Ys.

% Caso bas: lista vacia
filtra([],[]).

% Caso iterativo: lista no vacia
filtra([H|T],[H|T1]):-
  subtract(T,[H],T2), filtra(T2,T1).
