%% This program determines if a triangle is equilateral, 
%% isosceles or scalene
%% values should be positive
%% To be a triangle X + Y should be greater than Z, otherwise is not a triangle. 

valid_triangle(X, Y, Z) :-
    X > 0, Y > 0, Z > 0,
    X + Y > Z, X + Z > Y, Y + Z > X.

euilateral(X, Y, Z) :-
    X =:= Y, X =:= Z, Y =:= Z.

scalene(X, Y, Z) :-
     \+ (X = Y), \+ (X = Z), \+ (Y = Z).


triangle(X, Y, Z) :-
    valid_triangle(X, Y, Z),
    euilateral(X, Y, Z),
    write('triangule is equilateral').

triangle(X, Y, Z) :-
    valid_triangle(X, Y, Z),
    scalene(X, Y, Z),
    write('triangule is scalene').

triangle(X, Y, Z) :-
    valid_triangle(X, Y, Z),
    write('triangule is isosceles').

triangle(X, Y, Z) :-
    \+ (valid_triangle(X, Y, Z)),
    write('this values does not correspond to a triangle').
