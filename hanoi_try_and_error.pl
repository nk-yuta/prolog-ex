% Step1
pole([A | AL], B, [], N) :- N > 0, N1 is N - 1, pole(AL, B, [A], N1), writeln(pole(AL, B, [A], N1)).
pole([A | AL], B, L, N) :- N > 0, N1 is N - 1, pole(AL, B, [A | L], N1), writeln(pole(AL, B, [A | L], N1)).
% Step2
pole([], [], [_| _], N).

