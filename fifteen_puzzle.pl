

top(1).
top(2).
top(3).
top(4).
left(1).
left(5).
left(9).
left(10).
right(4).
right(8).
right(12).
right(16).
bottom(13).
bottom(14).
bottom(15).
bottom(16).
bottom(17).

movable(I, J) :- not(right(I)), J is I + 1.
movable(I, J) :- not(left(I)), J is I - 1.
movable(I, J) :- not(top(I)), J is I - 4.
movable(I, J) :- not(bottom(I)), J is I + 4.

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

fif_board([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0], N, H, 0).

fif_board(L, N, H, M) :- 
    N > 0, N1 is N - 1,
    nth1(I, L, 0),
    movable(I, J),
    swap(L, I, J, R),
    not(member(R, H)),
    fif_board(R, N1, [R |H], M1),
    M is M1 + 1,
    writeln(fif_board(R)).

try_fif(L, Max, Count) :-
    gennum(N, Max),
    writeln(N),
    fif_board(L, N, [], Count).

gennum(0, _).
gennum(N, D) :-
    D > 0, D1 is D - 1, gennum(N1, D1), N is N1 + 1.
    
% one turn: fif_board([1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,15], 20, []).
% two turn: fif_board([1,2,3,4,5,6,7,8,9,10,0,12,13,14,11,15], 20, []). 

% check 11 turn: try_fif([1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,10], 20, C).
% check 19 turn: try_fif([1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,4], 20, C).
% check 21 turn: try_fif([1,0,3,4,5,6,7,8,9,10,11,12,13,14,15,2], 25, C).

