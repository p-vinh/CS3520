/* Consider a representation of sets as lists. Define the following predicates:
is_member(X,L), which is true iff X is a member of L. (5 points)
?- is_member(3,[1,2,3]).
true. */

is_member(N, [N|_]).
is_member(N, [_|T]) :- is_member(N, T).

/* is_subset(L1,L2), which is true iff L1 is a subset of L2. (5 points)
?- is_subset([1],[1,2,3]).
true. */

is_subset([], _).
is_subset([H|T], L) :- is_member(H, L), is_subset(T, L).

/* is_union(L1,L2,LR), which is true iff LR is the union of L1 and L2. (5 points)
?- is_union([1,2],[3,4],LR).
LR = [1,2,3,4]. */

is_union([], L2, L2).
is_union([H|T], L2, LR) :-
    is_member(H, L2),
    !,
    is_union(T, L2, LR).
is_union([H|T], L2, [H|LR]) :-
    is_union(T, L2, LR).

/* is_intersect(L1,L2,LR), which is true iff LR is the intersection of L1 and L2. (5 points)
?- is_intersect([1,2],[2,3],LR).
LR = [2]. */

is_intersect([], _, []).
is_intersect([H|T], L2, [H|LR]) :- is_member(H, L2), is_intersect(T, L2, LR).
is_intersect([_|T], L2, LR) :- is_intersect(T, L2, LR).

/* is_power(L,LR), which is true iff LR is the power set of L. (15 points)
?- is_power([1,2],LR).
LR = [[],[1],[2],[1,2]]. */


/* Define a relation quicksort(L,SL) which maps a list L to a list SL which is the sorted version of L using the quicksort algorithm. (10 points)
?- quicksort([4,2,6,1,3],SL).
SL = [1,2,3,4,6]. */

% Base Case
quicksort([H], [H]).
quicksort([], []).

quicksort([H|T], SL) :- partition_H([H|T], H, L1, L2), quicksort(L1, LR), quicksort(L2, LR2), append(LR, [H|LR2], SL). 


partition_H([], _, [], []).
partition_H([P|T], P, L, G) :- partition_H(T, P, L, G).
partition_H([H|T], P, [H|L], G) :- H < P, partition_H(T, P, L, G).
partition_H([H|T], P, L, [H|G]) :- H > P, partition_H(T, P, L, G).


/* Define a relation mergesort(L,SL) which maps a list L to a list SL which is the sorted version of L using the mergesort algorithm. (10 points)
?- mergesort([4,2,6,1,3],SL).
SL = [1,2,3,4,6]. */

mergesort([H], [H]).
mergesort([], []).
mergesort([H|T], SL) :- list_size([H|T], Midpoint), MP is ceil(Midpoint / 2), split([H|T], MP, R1, R2),
                        mergesort(R1, LR1), mergesort(R2, LR2), merge(LR1, LR2, SL).

list_size([], 0).
list_size([_|T], S) :- list_size(T, R), S is R + 1.

split([], _, [], []).
split(L, 0, [], L).
split([H|T], N, R1, R2) :- C is N - 1, split(T, C, R, R2), R1 = [H | R].

/* Determine whether two numbers are amicable: (15 points)
?- are_amicable(220,284).
true. */

