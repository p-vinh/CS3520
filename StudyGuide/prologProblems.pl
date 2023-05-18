% 1. Create a function that computes x^y.
power(_, 0, 1).
power(X, Y, R) :- power_h(X, Y, R).

power_h(_, 0, 1).
power_h(X, Y, R) :- M is Y - 1, power_h(X, M, R1), R is X * R1. 

% 2. Create a function that computes x^2 without using multiplication by using the following recursive definition: 0^2 = 0 , n^2 = (n-1)^2 + n + n - 1.

square(0, 0).
square(N, R) :- M is N - 1, square(M, R1), R is R1 + N + N - 1.

% 3. Create a function that takes a list of pairs of integers, and orders the elements of each pair in non-increasing order.
%       For example, the list [(2,1) , (3,2) , (6,1)] will result in the list [(1,2) , (2,3) , (1,6)].
%       Hint: use dotted lists for the pairs in Lisp, and for Prolog you will have to define a relation pair(X,Y).

listorder([], []).
listorder([(X, Y) | T], [(H, T1) | R]) :- (X >= Y -> (H = Y, T1 = X); (H = X, T1 = Y)), listorder(T, R).

            
% 4. Create a function that takes a list of integers and returns a pair consisting of the sum of the numbers in even positions and the sum of the numbers in odd positions.
%       For example, for the list [1,2,3,4] the function should return (4,6).

sumpos(L, R) :- sumpos_h(L, Even, Odd), append([Even], [Odd], R).

sumpos_h([], 0, 0).
sumpos_h([X], X, 0).
sumpos_h([X, Y| Rest], Even, Odd) :- sumpos_h(Rest, EvenStore, OddStore), Even is EvenStore + X, Odd is OddStore + Y.

% 5. Create a function that takes a list of pairs of integers and returns a list with the sum of the elements of every pair.
%       For example, for the list [(1,2) , (3,4) , (5,6)] the function should return [3,7,11].

sumOfPairs([], []).
sumOfPairs([(X, Y) | T], [S|R]) :- S is X + Y, sumOfPairs(T, R).

% 6. Create a function that takes a list of pairs of integers and returns a pair with the sum of the elements in the first position and
%       the sum of the elements in the second position. For example, for the list [(1,2) , (3,4) , (5,6)] the function should return (9,12).

sumper(L, R) :- sumper-h(L, Left, Right), append([Left], [Right], R).

sumper_h([], 0, 0).
sumper_h([H|T], Left, Right) :- sumper_h(H, LeftStore, RightStore), sumper-h(T, PLeftStore, PRightStore), Left is LeftStore + PLeftStore, Right is RightStore + PRightStore.
sumper_h([X, Y], Left, Right) :- Left is X, Right is Y.


% 7. Polynomials may be represented as lists of integer, where each integer is the coefficient of the corresponding monomial.
%       For example, x^3 + 3x - 7 can be represented as [1,0,3,7]. Create a function that takes a polynomial as a list and evaluates the polynomial at a given point x_0.
%       Hint: use the function from problem (1).

polynomial([], 0).
polynomial(L, X, R) :- polynomial_h(L, X, 0, 0, R).

polynomial_h([], _, _, Sum, Sum) :- !.
polynomial_h([H|T], X, Sign, Sum, R) :- H =:= 0 -> polynomial_h(T, X, 0, Sum, R);
        length([H|T], M), N is M - 1, power(X, N, V),
        (Sign mod 2 =:= 0 -> S is H * V + Sum; S is Sum - H * V), polynomial_h(T, X, 1, S, R).


% 8. Create a function that eliminates all duplicate elements from a list. 
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d] the function should return [a,b,c,d].

nodups([H|T], R) :- nodups_h(T, [H], V), reverse(V, R).

nodups_h([], [], []).
nodups_h([], L, L).
nodups_h([], L, R).
nodups_h([H|T], L, R) :- member(H, L) -> nodups_h(T, L, R); nodups_h(T, [H|L], R).


% 9. Create a function that packs consecutive duplicate elements of a list into sublists.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a] , [b,b] , [a] , [c] , [b] , [c,c] , [d] , [a] , [d]]

pack([], []).
pack([H|T], [R1|R]) :- pack_h([H|T], H, [], R1), go_to_pos([H|T], T1), pack(T1, R).

pack_h([], _, Acc, Acc).
pack_h([X|T], X, Acc, R) :- pack_h(T, X, [X|Acc], R).
pack_h(_, _, Acc, Acc).

go_to_pos([X, X | Rest], Result) :-
    go_to_pos([X | Rest], Result).
go_to_pos([_ | Rest], Result) :- Result = Rest.

% 10. Create a function that packs all duplicate elements of a list into sublists.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a,a,a] , [b,b,b] , [c,c,c] , [d,d]].

packDups([], []).
packDups([H|T], R) :- packDups_h([H|T], H, R1), removeDups([H|T], H, L), packDups(L, R2), R = [R1|R2].

packDups_h([], _, []).
packDups_h([H|T], X, R) :- H = X -> packDups_h(T, X, R1), R = [H|R1];
                                    packDups_h(T, X, R).  

% 11. Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].

% if first element of the cdr is the same as current element add 1 to accumulator
% if different add accumulator and current element to list
dencoder([H|T], R) :- lencoder(H, T, 0, R).

lencoder(X, [], Cnt, []).
lencoder(X, [X|T], Cnt, R) :- M is Cnt + 1, lencoder(X, T, M, R).
lencoder(X, [H|T], Cnt, R) :- append([X], [Cnt], Z), lencoder(H, T, 1, LR), append([Z], LR, R).


% 12. Create a function that decodes length encoding. For example, the code list [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)]
%       should return [a,b,b,a,c,b,c,c,d,a,d].

decode([], []).
decode([(N, E)| T], R) :- decode_h(E, N, R1), decode(T, R2), append(R1, R2, R).

decode_h(_, 0, []).
decode_h(Elm, Cnt, [Elm|R]) :- M is Cnt - 1, decode_h(Elm, M, R).


% 13. Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b.
%       For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.
sublist(_, A, B, []) :- A > B.
sublist([], _, _, []).

sublist([_|T], A, B, R) :- A >= 0, A1 is A - 1, B1 is B - 1, sublist(T, A1, B1, R).
sublist([H|T], 0, B, [H|R]) :- B >= 0, B1 is B - 1, sublist(T, 0, B1, R).




% 14. Create a version of the function in problem (13) that when a > b it doesn't return an empty list, 
%       but the sublist that starts at a and ends in b wrapping around the end of the list. For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3,
%       the function should return [6,7,1,2,3,4].

dublst([H|T], Left, Right, R) :- sublst(H, T, 0, Left, Right, RL, RR), append(RL, RR, R).

sublst(X, [], _, Left, Right, [X], []).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt =< Right, Next is Cnt + 1, sublst(H, T, Next, Left, Right, L, RightStore), append([X], RightStore, R).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt >= Left, Next is Cnt + 1, sublst(H, T, Next, Left, Right, LeftStore, R), append([X], LeftStore, L).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt < Left, Cnt > Right, Next is Cnt + 1, sublst(H, T, Next, Left, Right, L, R).


% 15. Create a a function that takes a pair of integers a and b, and returns a list with every integer between a and b. 
%       For example, for the input 2 and 7 the function should return the list [2,3,4,5,6,7]. If a > b the function should return an empty list.

between([H|T], Left, Right, R) :- between_h(H, T, 1, Left, Right, R).

between_h(X, [], _, Left, Right, [X]).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt >= Left, Cnt =< Right, Next is Cnt + 1, between_h(H, T, Next, Left, Right, Store), append([X], Store, R).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt < Left, Next is Cnt + 1, between_h(H, T, Next, Left, Right, R).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt > Right, Next is Cnt + 1, between_h(H, T, Next, Left, Right, R).


% 16. Create a function that takes a list of a number k and a list, and returns a list of lists with all the combinations of k distinct elements from the list.
%       For example, for integer 2 and the list [a,b,c] the function should return [[a,b] , [a,c] , [b,c]].


% This is the top function. Takes a list (set) and a number and returns all possible
% combinations of size k from the given set.

combination(_,0,[[]]).
combination(L,K,R) :- length(L,R1), K = R1, R = [L].
combination(L,K,R) :- J is K-1, combination(L,J,R1),
                      combination_h(L,R1,[],R).

combination_h([],_,Acc,Acc).
combination_h([H|T],Pcomb,Acc,R) :- proj_u(H,Pcomb,[],R1),
                                    sp_u(R1,Acc,R2),
                                    combination_h(T,Pcomb,R2,R).

proj_u(_,[],Acc,Acc).
proj_u(X,[H|T],Acc,R) :- member(X,H) ->  proj_u(X,T,Acc,R);
                         proj_u(X,T,[[X|H]|Acc],R).

sp_u([],S2,S2).
sp_u(S1,[],S1).
sp_u([H|T],S2,R) :- sp_m(H,S2) ->  sp_u(T,S2,R);
                    sp_u(T,[H|S2],R).

sp_m(_,[]) :- !, fail.
sp_m(X,[H|T]) :- subset(X,H), subset(H,X);
                 sp_m(X,T).

% 17. Create a function that takes a list and returns a pair with two lists: one with elements that are less than or equal to the first element,
%   and the other with the elements that are greater than the first element. For example, for the list [3,1,4,2,0,5] the function should return ([1,2,0,3] , [4,5]).

comp([H|T], R) :- comp_h(H, [H|T], Less, More), append([Less], [More], R).

comp_h(X, [], [], []).
comp_h(X, [H|T], Less, More) :- H =< X, comp_h(X, T, LessStore, More), append([H], LessStore, Less).
comp_h(X, [H|T], Less, More) :- H > X, comp_h(X, T, Less, MoreStore), append([H], MoreStore, More).

% 18. Create a function that takes two sorted lists and merges them into a single sorted list. 
%       For example, for the input [0,2,4] and [1,3,5] the function should return [0,1,2,3,4,5].

mergeL([], [], []).
mergeL([], L2, L2).
mergeL(L1, [], L1).

mergeL([H1|T1], [H2|T2], [H1|R]) :- H1 < H2, mergeL(T1, [H2|T2], R).
mergeL([H1|T1], [H2|T2], [H2|R]) :- H1 >= H2, mergeL([H1|T1], T2, R).

% 19. Create a function that takes a list of integers and returns a pair with the least and greatest elements in the list. 
%       For example for the list [0,1,2,3,4] the function should return (0,4).

min_max_pair([],[]).
min_max_pair(L, (Min, Max)) :- min_list(L, Min), max_list(L, Max).



% 20 .Create a function that takes a list and an element and removes all copies of this element from the list. 
%       For example, for the input [a,b,c,a,d,a,e] and a, the function should return [b,c,d,e].

removeDups([], _, []).
removeDups([H|T], H, R) :- removeDups(T, H, R).
removeDups([H|T], X, [H|R]) :- removeDups(T, X, R).