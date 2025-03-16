% :- module(utils, [
%     transpose/2,
%     prefix_matrix/3,
% ]).

% relates a rectangular matrix and its transpose
transpose([], []).
transpose([F|Fs], Ts) :-
    transpose(F, [F|Fs], Ts).

transpose([], _, []).
transpose([_|Rs], Ms, [Ts|Tss]) :-
        prefix_matrix(Ms, Ts, Ms1),
        transpose(Rs, Ms1, Tss).

% relates rectangular prefix matrix, its prefix and the same matrix without the prefix.
prefix_matrix([], [], []).
prefix_matrix([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        prefix_matrix(Rest, Fs, Oss).