:- use_module(library(clpfd)).

:- ['../prolog/clpfd_utils'].
:- ['../prolog/utils'].

:- set_prolog_flag(clpfd_monotonic,true).

:- op(700, xfx, pins).
:- op(920, fy, *). % declarative debugging operators.

*_.

sudoku(I) :-
    length(I,9), maplist(same_length(I), I),      % length restrictions
    append(I,Entries), Entries pins 1..9,         % domain restrictions
    maplist(pall_distinct,I),                     % horizontal restrictions
    ptranspose(I,TI), maplist(pall_distinct,TI),  % vertical restrictions
    I = [L1,L2,L3,L4,L5,L6,L7,L8,L9],             % square restrictions
    squares_restrictions(L1,L2,L3),
    squares_restrictions(L4,L5,L6),
    squares_restrictions(L7,L8,L9).

squares_restrictions([],[],[]).
squares_restrictions([V1,V2,V3 | R1],
                     [V4,V5,V6 | R2],
                     [V7,V8,V9 | R3]) :-
    pall_distinct([V1,V2,V3,V4,V5,V6,V7,V8,V9]),
    squares_restrictions(R1,R2,R3).