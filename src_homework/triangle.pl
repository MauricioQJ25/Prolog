%% This program determines if a triangle is equilateral, 
%% isosceles or scalene
%% values should be positive
%% To be a triangle X + Y should be greater than Z, otherwise is not a triangle. 

triangle(X, Y, Z) :-
    X > 0, Y > 0, Z > 0,
    X + Y > Z, 
    X =:= Y, Y =:= Z,
    write('triangule is equilateral').

triangle(X, Y, Z) :-
    X > 0, Y > 0, Z > 0,
    X + Y > Z, 
    \+ (X = Y), \+ (X = Z), \+ (Y = Z),
    write('triangule is scalene').

triangle(X, Y, Z) :-
    X > 0, Y > 0, Z > 0,
    X + Y > Z, 
    write('triangule is isosceles').