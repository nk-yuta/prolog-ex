

top(1).
top(2).
top(3).
left(1).
left(4).
left(7).
right(3).
right(6).
right(9).
bottom(7).
bottom(8).
bottom(9).

movable(I, J) :- not(right(I)), J is I + 1.
movable(I, J) :- not(left(I)), J is I - 1.
movable(I, J) :- not(top(I)), J is I - 3.
movable(I, J) :- not(bottom(I)), J is I + 3.

replace(1, [B| L], A, [A| L], B).
replace(I, [X| L], A, [X| R], B) :-
    I > 1,
    I1 is I - 1,
    replace(I1, L, A, R, B).

swap(L, I, I, L) :- !.
swap(L, I, J, R) :- 
    I > J, swap(L, J, I, R), !.
swap([A| L], 1, J, [B| R]) :-
    J1 is J - 1, replace(J1, L, A, R, B), !.
swap([A| L], I, J, [A| R]) :-
    I1 is I - 1, J1 is J - 1,
    swap(L, I1, J1, R).

eight_board([1,2,3,4,5,6,7,8,0], N, H, 0).

eight_board(L, N, H, M) :- 
    N > 0, N1 is N - 1,
    nth1(I, L, 0),
    movable(I, J),
    swap(L, I, J, R),
    not(member(R, H)),
    eight_board(R, N1, [R |H], M1),
    M is M1 + 1,
    writeln(eight_board(R)).

try_eight(L, Max, Count) :-
    gennum(N, Max),
    writeln(N),
    eight_board(L, N, [], Count).

gennum(0, _).
gennum(N, D) :-
    D > 0, D1 is D - 1, gennum(N1, D1), N is N1 + 1.
    
% ex. eight_board([1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,15], 20, []).