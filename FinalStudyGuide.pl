% Create a function that computes x^2 without using multiplication by using the following recursive definition: 0^2 = 0 , n^2 = (n-1)^2 + n + n - 1.
expn(0, 0).
expn(X, R) :- X > 0, M is X - 1, expn(M, Z), R is Z + X + X - 1.

% Create a function that takes a list of integers and returns a pair consisting of the sum of the numbers in even positions and the sum of the numbers in odd positions. 
% For example, for the list [1,2,3,4] the function should return (4,6).
sumpos(L, R) :- sumpos_h(L, Even, Odd), append([Even], [Odd], R).

sumpos_h([], 0, 0).
sumpos_h([X], X, 0).
sumpos_h([X, Y| Rest], Even, Odd) :- sumpos_h(Rest, EvenStore, OddStore), Even is EvenStore + X, Odd is OddStore + Y.

% Create a function that takes a list of pairs of integers and returns a pair with the sum of the elements in the first position and the sum of the elements in 
% the second position. For example, for the list [(1,2) , (3,4) , (5,6)] the function should return (9,12).
sumper(L, R) :- sumper-h(L, Left, Right), append([Left], [Right], R).

sumper_h([], 0, 0).
sumper_h([H|T], Left, Right) :- sumper_h(H, LeftStore, RightStore), sumper-h(T, PLeftStore, PRightStore), Left is LeftStore + PLeftStore, Right is RightStore + PRightStore.
sumper_h([X, Y], Left, Right) :- Left is X, Right is Y.

% Create a function that eliminates all duplicate elements from a list. For example, for the list [a,b,b,a,c,b,c,c,d,a,d] the function should return [a,b,c,d].
% nodups([], []).
% nodups([H|T], R) :- is_member(H, T) -> nodups(T, R); nodups(T, Z), append([H], Z, R).

nodups([H|T], R) :- nodups_h(T, [H], V), reverse(V, R).

nodups_h([], [], []).
nodups_h([], L, L).
nodups_h([], L, R).
nodups_h([H|T], L, R) :- member(H, L) -> nodups_h(T, L, R); nodups_h(T, [H|L], R).


% Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position. 
% For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].

% if first element of the cdr is the same as current element add 1 to accumulator
% if different add accumulator and current element to list
dencoder([H|T], R) :- lencoder(H, T, 0, R).

lencoder(X, [], Cnt, []).
lencoder(X, [X|T], Cnt, R) :- M is Cnt + 1, lencoder(X, T, M, R).
lencoder(X, [H|T], Cnt, R) :- append([X], [Cnt], Z), lencoder(H, T, 1, LR), append([Z], LR, R).

% Create a version of the function in problem (13) that when a > b it doesn't return an empty list, but the sublist that starts at a and ends in b wrapping around 
% the end of the list. For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3, the function should return [6,7,1,2,3,4].
dublst([H|T], Left, Right, R) :- sublst(H, T, 0, Left, Right, RL, RR), append(RL, RR, R).

sublst(X, [], _, Left, Right, [X], []).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt =< Right, Next is Cnt + 1, sublst(H, T, Next, Left, Right, L, RightStore), append([X], RightStore, R).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt >= Left, Next is Cnt + 1, sublst(H, T, Next, Left, Right, LeftStore, R), append([X], LeftStore, L).
sublst(X, [H|T], Cnt, Left, Right, L, R) :- Cnt < Left, Cnt > Right, Next is Cnt + 1, sublst(H, T, Next, Left, Right, L, R).

% Create a a function that takes a pair of integers a and b, and returns a list with every integer between a and b. For example, for the input 2 and 7 the function should 
% return the list [2,3,4,5,6,7]. If a > b the function should return an empty list.
between([H|T], Left, Right, R) :- between_h(H, T, 1, Left, Right, R).

between_h(X, [], _, Left, Right, [X]).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt >= Left, Cnt =< Right, Next is Cnt + 1, between_h(H, T, Next, Left, Right, Store), append([X], Store, R).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt < Left, Next is Cnt + 1, between_h(H, T, Next, Left, Right, R).
between_h(X, [H|T], Cnt, Left, Right, R) :- Cnt > Right, Next is Cnt + 1, between_h(H, T, Next, Left, Right, R).

% Create a function that takes a list and returns a pair with two lists: one with elements that are less than or equal to the first element, 
% and the other with the elements that are greater than the first element. For example, for the list [3,1,4,2,0,5] the function should return ([1,2,0,3] , [4,5]).
comp([H|T], R) :- comp_h(H, [H|T], Less, More), append([Less], [More], R).

comp_h(X, [], [], []).
comp_h(X, [H|T], Less, More) :- H =< X, comp_h(X, T, LessStore, More), append([H], LessStore, Less).
comp_h(X, [H|T], Less, More) :- H > X, comp_h(X, T, Less, MoreStore), append([H], MoreStore, More).