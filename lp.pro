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

sum-up-numbers-general([H|T],N):-%error: syntax
    atom(H),
    sum-up-numbers-general(T,N).%error: logic

sum-up-numbers-general([H|T], N):-
    sum-up-numbers-general(T,Value),
    N is H + Value.


