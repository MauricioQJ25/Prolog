%% The program adds two n x m matrix.
%% Both matrix should have numbers and the program checks if both matrix have the same size
%% and if both matrix are valid.

%% This function first validate if the matrix is correct and then calls a support function that adds both matrix.
sumamatriz([],[],[]).
sumamatriz([X|Xs],[Y|Ys],[SF|SFs]) :-  contar(X,C), validarFilas(Xs,Ys,C), sumaFila(X,Y,SF), sumamatriz2(Xs,Ys,SFs).
sumamatriz([X],[Y],[SF]) :- sumaFila(X,Y,SF).

%% This is the support function that adds both matrix by adding row by row.
sumamatriz2([],[],[]).
sumamatriz2([X|Xs],[Y|Ys], [SF|SFs]) :- sumaFila(X, Y, SF), sumamatriz2(Xs,Ys,SFs).
sumamatriz2([X],[Y],[SF]) :- sumaFila(X,Y,SF).

%% This function adds the n element of each list.
sumaFila([],[],[]).
sumaFila([ X | Xs ], [ Y | Ys ], [ SF | SFs ]) :- SF is X + Y, sumaFila( Xs , Ys , SFs).
sumaFila([X], [Y], [SF]) :- SF is X+Y.

%% This function counts the number of elements in a row.
contar([],0).
contar([_|X],C) :- contar(X, C1), C is C1+1.
contar([_],1).

%% This function checks if each row has the same number of elements.
validarFilas([],[],_).
validarFilas([X|Xs],[Y|Ys],C) :- validarFilas2(X,Y,C), validarFilas(Xs,Ys,C).
validarFilas([X],[Y],C) :- validarFilas2(X,Y,C).

%% This function validates that both rows have the same number of elements and the correct count.
validarFilas2([],[],0).
validarFilas2([_],[_],1).
validarFilas2([_|Xs],[_|Ys],C) :- Cx is C - 1, validarFilas2(Xs, Ys, Cx).
