%Number one
sum-up-numbers-simple([], 0).%null case
sum-up-numbers-simple([H|T], N):-%if number add value to N then test rest of list
    number(H),
    sum-up-numbers-simple(T,Value),
    N is H+Value.

sum-up-numbers-simple([H|T], N):-%if not number move on to test rest of list
    \+number(H),
    sum-up-numbers-simple(T,N).



%number two
sum-up-numbers-general([],0).%null case
sum-up-numbers-general([[]],0).%null case
sum-up-numbers-general([H|T], N):-%if a number is found then add to N and test the remaining list in function again
    number(H),
    sum-up-numbers-general(T,Value),
    N is H+Value.

sum-up-numbers-general([H|T],N):-%if atom is founf move on the rest to test rest of list
    atom(H),
    sum-up-numbers-general(T,N).

sum-up-numbers-general([H|T], N):-%else a sublist then add whatever numbers found to N
    sum-up-numbers-general(T,Value),
    N is H + Value.



%number three
%newlist([], []).
% make new list of just numbers. Find minimum inlist then sort list one.
% Find the first numbe rin list one greater than listwo minimum or make
% new list of all list one values greater than list two minimum then
% find minimum of list one's new list
newlist([X|Y], L):-%if a number then append to new list
    number(X),
    append([X|Y], L),
    newlist(Y,L).

newlist([X|Y], L):-%if not a number check rest of list
    \+number(X),
    newlist(Y, L).

sortlist([], []).%sort list one in ascending order

min-value([H,X|T], L):-%if first element less than second, check rest of element against first element
    H=<X,
    min-value([H|T],L).

min-value([H,X|T], L):-%if second element if smaller than first checkrest of list against second element
    H>X,
    min-value([X|T],L).

min-value([H|T], L):-%test last value with minimum
    H<L,
    min-value(T,L).





%number four
common-unique-elements([],[],[]).%null cases
common-unique-elements([H|T],L,[H|Y]):-%if list is member of list then move to test rest of list.H returned
   member(H,L),
   common-unique-elements(T,L,Y).

common-unique-elements([_|T],L,Y):-%test rest of list anyway
    common-unique-elements(T,L,Y).
