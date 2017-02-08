%number one
sum-up-numbers-simple([], 0).
sum-up-numbers-simple([H|T], N):-
    number(H),
    sum-up-numbers-simple(T,Value),
    N is H+Value.

sum-up-numbers-simple([H|T], N):-
    \+number(H),
    sum-up-numbers-simple(T,N).



%number two
sum-up-numbers-general([],0).
sum-up-numbers-general([[]],0).
sum-up-numbers-general([H|T], N):-
    number(H),
    sum-up-numbers-general(T,Value),
    N is H+Value.

sum-up-numbers-general([H|T],N):-
    atom(H),
    sum-up-numbers-general(T,N).

sum-up-numbers-general([H|T], N):-
    sum-up-numbers-general(T,Value),
    N is H + Value.



%number three
%newlist([], []).
newlist([X|Y], L):-
    number(X),
    append([X|Y], L),
    newlist(Y,L).

newlist([X|Y], L):-
    \+number(X),
    newlist(Y, L).

sortlist([], []).

min-value([H,X|T], L):-
    H=<X,
    min-value([H|T],L).

min-value([H,X|T], L):-
    H>X,
    min-value([X|T],L).





%number four
common-unique-elements([],[],[]).
common-unique-elements([H|T],L,[H|Y]):-
   member(H,L),
   common-unique-elements(T,L,Y).

common-unique-elements([_|T],L,Y):-
    common-unique-elements(T,L,Y).

member(X,[X,_]).
member(X,[_|Z]):-
    member(X,Z).
