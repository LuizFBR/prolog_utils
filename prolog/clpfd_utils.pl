:- module(clpfd_utils,[
    pall_distinct/1,
    apply_hash/2,
    op(700, xfx, pins),
    pins/2
]).

:- use_module(library(clpfd)).
:- set_prolog_flag(clpfd_monotonic, true).

:- op(700, xfx, pins).

% Pure version of L ins X..Y.
L pins X..Y :-
    same_length(L,Ds), maplist(=(X..Y),Ds),
    maplist(in, L, Ds).

% relates a list of vars with # over all elements over a list.
apply_hash([],[]).
apply_hash([L|Ls],[HL|HLs]) :-
    HL = #(L),
    apply_hash(Ls,HLs).

% purely makes all clpfd variables distinct.

pall_distinct([]).
pall_distinct(L) :-
    apply_hash(L,HT),
    pall_distinct_(HT).

pall_distinct_([]).
pall_distinct_([H|T]) :-
    maplist(#\=(H),T),
    pall_distinct_(T).

