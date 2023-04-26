list_last([], _) :- fail. /* Empty list */
list_last([X], X). /* Only one Element, Predicate Rule */
list_last([_|T], R) :- list_last(T, S), R = S. /* Going through List */


list_nth([H | _], 0, H). /* If number is 0, return H */
list_nth([_ | T], N, R) :- M is N - 1, list_nth(T, M, S), R = S.

/* Size of the list */
list_size([], 0).
list_size([_|T], S) :- list_size(T, R), S is R + 1.


/*Tail recursive*/
list_size_h([], A, A).
list_size_h([_|T], A, R) :- B is A + 1, list_size_h(T, B, R).

list_sizeT(L, S) :- list_size_h(L, 0, S).



/* Palindrome */
is_palindrome([]).
is_palindrome(L) :- my_reverse(L, [], R), L = R.

my_reverse_h([], A, A).
my_reverse_h([H|T], A, R) :- my_reverse_h(T, [H|A], R).

/* Duplicates */

dups([], []).
dups([H|T], R) :- dups(T, S), R = [H, H | S].

/* A list and a number split the list based on the number */

split([], _, [], []).
split(L, 0, [], L).
split([H|T], N, R1, R2) :- C is N - 1, split(T, C, R, R2), R1 = [H | R].

/*Flips alternate elements of a list. That is, if the input is (a_1 a_2 ... a_n) then the output is (a_2 a_1 a_4 a_3 ... a_n a_n-1). If n is odd, a_n remains at the end. Name the function flip. */

flip([], []).
flip([H | T], R) :- flip(T, S), S = [H | R].


/* Rotate */

rotate([], _, []).
rotate(L, N, R) :- split(L, N, R1, R2), append(R2, R1, R).

/* Create a predicate that maps a list and a natural number n to another list that is the first list except every element is duplicated n times.
 *  ex: dups_n([2, 1, 3], 3, [2,2,2,1,1,1,3,3,3]).

*/


dups_n([], _, []). /* If the input is empty. Return the empty list */
dups_n(_, 0, []). /* If N is 0 then don't duplicate. Return empty list */
dups_n(L, 1, L). /* If N is 1 just duplicate once */
dups_n([H|T], N, R) :- sdups_n(H, N, RL1), dups_n(T, N, RL2), append(RL1, RL2, R).


sdups_n(_, 0, []).
sdups_n(H, N, R) :- M is N - 1, sdups_n(H, M, R1), R = [H | R1].


/* Given a list and natural number n, write a predicate that drops every nth element.
 *  Ex:
 *  drop_nth([1,2,3,4,5,6,7,8], 2, [1,3,5,7]).
*/

drop_nth(L, 0, L).
drop_nth(_, 1, []).
drop_nth([], _, []).
drop_nth(L, N, R) :- M is N - 1, split-h(L, M, L1, L2), drop_nth(L2, N, R1), append(L2, R1, R).


split-h([], _, [], []).
split-h(L, 0, [], L).
split-h([H|T], N, R1, R2) :- C is N - 1, split(T, C, R, R2),L1 = [H | LR1], R2 = [H | R], L2 = T.
