% Rensyu1

parent(taro, hanako).
parent(hanako, jiro).
parent(taro, saburo).
parent(hanako, shiro).
parent(saburo, ishiro).
parent(shiro, goro).


% Rensyu2

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
brother(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).


% Rensyu3

first(A, [A|_]).
secound(B, [_,B|_]).
third(C, [_, _, C]).

% Rensyu4
my_member(X, [X|_]).
my_member(X, [Y | List]) :- my_member(X, List).

% Rensyu5
my_length([], 0).
my_length([_ | Y], N) :- my_length(Y, N1), N is N1 + 1.

% Rensyu6
sumup(1, 1).
sumup(N, X) :- N > 1, N1 is N -1, sumup(N1, X1), X is N + X1.

% Rensyu7
sumup(1, 1).
sumup(N, X) :- N1 is N - 1, sumup(N1, X1), !, X is N + X1.

% Rensyu8
gennum(0).
gennum(X) :- gennum(X1), X is X1 + 1.
