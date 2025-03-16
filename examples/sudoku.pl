:- use_module(library(clpfd)).

:- ['../prolog/clpfd_utils'].
:- ['../prolog/utils'].

:- set_prolog_flag(clpfd_monotonic,true).

:- op(920, fy, *).

*_.

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

sudoku(I) :-
    length(I,9), maplist(same_length(I), I),     % length restrictions
    append(I,Entries), Entries ins 1..9,         % domain restrictions
    maplist(all_distinct,I),                     % horizontal restrictions
    ptranspose(I,TI), maplist(all_distinct,TI),  % vertical restrictions
    I = [L1,L2,L3,L4,L5,L6,L7,L8,L9],            % square restrictions
    squares_restrictions([L1,L2,L3]),
    squares_restrictions([L4,L5,L6]),
    squares_restrictions([L7,L8,L9]).

squares_restrictions([],[],[]).
squares_restrictions([[V1,V2,V3 | R1],
                      [V4,V5,V6 | R2],
                      [V7,V8,V9 | R3]]) :-
    all_distinct([V1,V2,V3,V4,V5,V6,V7,V8,V9]),
    squares_restrictions([R1,R2,R3]).

pall_distinct([]).
pall_distinct([H|T]) :-
    maplist(dif(H),T),
    pall_distinct(T).