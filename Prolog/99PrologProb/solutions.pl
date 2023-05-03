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


is_union(L1, L2, LR) :- append(L1, L2, L), remove_dups(L, LR).

/* is_intersect(L1,L2,LR), which is true iff LR is the intersection of L1 and L2. (5 points)
?- is_intersect([1,2],[2,3],LR).
LR = [2]. */

/* is_power(L,LR), which is true iff LR is the power set of L. (15 points)
?- is_power([1,2],LR).
LR = [[],[1],[2],[1,2]]. */


/* Define a relation quicksort(L,SL) which maps a list L to a list SL which is the sorted version of L using the quicksort algorithm. (10 points)
?- quicksort([4,2,6,1,3],SL).
SL = [1,2,3,4,6]. */

/* Define a relation mergesort(L,SL) which maps a list L to a list SL which is the sorted version of L using the mergesort algorithm. (10 points)
?- mergesort([4,2,6,1,3],SL).
SL = [1,2,3,4,6]. */

/* Determine whether two numbers are amicable: (15 points)
?- are_amicable(220,284).
true. */