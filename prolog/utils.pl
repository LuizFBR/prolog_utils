:- module(utils, [
    ptranspose/2,
    prefix_matrix/3
]).

% relates a rectangular matrix and its transpose
ptranspose([], []).
ptranspose([F|Fs], Ts) :-
    ptranspose(F, [F|Fs], Ts).

ptranspose([], _, []).
ptranspose([_|Rs], Ms, [Ts|Tss]) :-
        prefix_matrix(Ms, Ts, Ms1),
        ptranspose(Rs, Ms1, Tss).

% relates rectangular prefix matrix, its prefix and the same matrix without the prefix.
prefix_matrix([], [], []).
prefix_matrix([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        prefix_matrix(Rest, Fs, Oss).