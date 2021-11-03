% This programs search for a value in a given tree
% and also count the number of members.

% tree( I, X, D)
% I is the left tree
% D is the right tree
% X is the root number.

% x_memb_tree(X, Tree): true if x is member of tree Tree

% nods_arb(Tree, N) : N is the number of members in the tree Tree


% Lets represent a tree with a list where n is the root and 2n +1 right member, 2n + 2 left member

%        1            // level  1 1
%    2       3        // level  2 3  +2
%  4   5    6  7      // level  3 7  +4
% 8 9 a b  c d e f    // level  4 15 +8

% Valid trees

tree(14, 7, 15).
tree(12, 6, 13).
tree(10, 5, 11).
tree(8, 4, 9).
tree(tree(12, 6, 13), 3, tree(14, 7, 15)).
tree(tree(8, 4, 9), 2, tree(10, 5, 11)).
tree(tree(tree(8, 4, 9), 2, tree(10, 5, 11)), 1, tree(tree(12, 6, 13), 3, tree(14, 7, 15))).

% This predicate checks if X is a member of a valid tree, valid trees are above.
x_memb_tree(X, tree(I,R,D)) :-
    tree(I,R,D),                            % check a valid tree
    (  (\+ tree(X, R, D), \+ tree(I, X, D), \+ tree(I, R, X) )  % check if X is a member
    -> ( \+(x_memb_tree(X, I))              % recursion for the left tree path
        -> x_memb_tree(X, D)                % recursion for the right tree path
            ; write(' Left side')
        )
    ;  format('~w belongs to a valid tree ', [X])
    ).


% nods_arb(Tree, N) : N is the number of members in the tree Tree
% All valid trees are completed, 
% valid tree should has 3, 7, or 15 nodes. 

nods_arb(tree(I,R,D), N) :-
    tree(I,R,D),
    ( nods_arb(I, P)
    -> N is 2*P+1
    ;  N is 3
    ).
