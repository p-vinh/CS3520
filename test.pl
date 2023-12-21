% 4 5 10 20
% 13. Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b.
% For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.

sublist(_, A, B, []) :- A > B.
sublist([], _, _, []).
sublist([_|T], A, B, R) :- A >= 0, A1 is A - 1, B1 is B - 1, sublist(T, A1, B1, R). % move through the list
sublist([H|T], 0, B, [H|R]) :- B >= 0, B1 is B - 1, sublist(T, 0, B1, R).


% 17. Create a function that takes a list and returns a pair with two lists: one with elements that are less than or equal to the first element,
% and the other with the elements that are greater than the first element. For example, for the list [3,1,4,2,0,5] the function should return ([1,2,0,3] , [4,5]).

partitionL([], []).
partitionL([H|T], R) :- partitionL_h([H|T], H, [], [], R).

partitionL_h([], _, Lesser, Greater, [Lesser, Greater]).
partitionL_h([H|T], Pivot, Lesser, Greater, R) :- Pivot >= H -> partitionL_h(T, Pivot, [H|Lesser], Greater, R);
																partitionL_h(T, Pivot, Lesser, [H|Greater], R).

% 2 Create a function that computes x^2 without using multiplication by using the following recursive definition: 0^2 = 0 , n^2 = (n-1)^2 + n + n - 1.
square(0, 0).
square(X, R) :- X1 is X - 1, square(X1, R1), R is X + X + R1 - 1.

% 7 Polynomials may be represented as lists of integer, where each integer is the coefficient of the corresponding monomial. For example, x^3 + 3x - 7 can be represented as [1,0,3,7]. 
% Create a function that takes a polynomial as a list and evaluates the polynomial at a given point x_0. Hint: use the function from problem (1).

pow(_, 0, 1).
pow(X, 1, X).
pow(X, Y, R) :- Y1 is Y - 1, pow(X, Y1, R1), R is R1 * X.

polynomial([], _, 0).
polynomial([H|T], X, R) :- length([H|T], L),
						   L1 is L - 1,
						   pow(X, L1, R2),
						   R3 is H * R2, polynomial(T, X, R1), R is R1 + R3.


% Create a version of the function in problem (13) that when a > b it doesn't return an empty list, but the sublist that starts at a and ends in b wrapping around the end of the list.
% For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3, the function should return [6,7,1,2,3,4].

testsublist([], _, _, []).
testsublist(L, A, B, R) :- A < B, testsublist_h(L, A, B, 0, [], [], R).
testsublist(L, A, B, R) :- testsublist_h(L, A, B, 0, [], [], R).

testsublist_h([], _, _, _, Acc, Acc2, R) :- reverse(Acc, T), reverse(Acc2, T1), append(T, T1, R).
testsublist_h([H|T], A, B, Cnt, Acc, Acc2, R) :- Cnt >= A, C is Cnt + 1, testsublist_h(T, A, B, C, [H|Acc], Acc2, R).
testsublist_h([H|T], A, B, Cnt, Acc, Acc2, R) :- Cnt =< B, C is Cnt + 1, testsublist_h(T, A, B, C, Acc, [H|Acc2], R);
														   C is Cnt + 1, testsublist_h(T, A, B, C, Acc, Acc2, R).
