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


% 5. Create a function that takes a list of pairs of integers and returns a list with the sum of the elements of every pair.
%       For example, for the list [(1,2) , (3,4) , (5,6)] the function should return [3,7,11].

sumOfPairs([], []).
sumOfPairs([(X, Y) | T], [S|R]) :- S is X + Y, sumOfPairs(T, R).

% 6. Create a function that takes a list of pairs of integers and returns a pair with the sum of the elements in the first position and
%       the sum of the elements in the second position. For example, for the list [(1,2) , (3,4) , (5,6)] the function should return (9,12).

% 7. Polynomials may be represented as lists of integer, where each integer is the coefficient of the corresponding monomial.
%       For example, x^3 + 3x - 7 can be represented as [1,0,3,7]. Create a function that takes a polynomial as a list and evaluates the polynomial at a given point x_0.
%       Hint: use the function from problem (1).


% 8. Create a function that eliminates all duplicate elements from a list. 
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d] the function should return [a,b,c,d].


% 9. Create a function that packs consecutive duplicate elements of a list into sublists.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a] , [b,b] , [a] , [c] , [b] , [c,c] , [d] , [a] , [d]]


% 10. Create a function that packs all duplicate elements of a list into sublists.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a,a,a] , [b,b,b] , [c,c,c] , [d,d]].


% 11. Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position.
%       For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].


% 12. Create a function that decodes length encoding. For example, the code list [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)]
%       should return [a,b,b,a,c,b,c,c,d,a,d].


% 13. Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b.
%       For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.


% 14. Create a version of the function in problem (13) that when a > b it doesn't return an empty list, 
%       but the sublist that starts at a and ends in b wrapping around the end of the list. For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3,
%       the function should return [6,7,1,2,3,4].


% 15. Create a a function that takes a pair of integers a and b, and returns a list with every integer between a and b. 
%       For example, for the input 2 and 7 the function should return the list [2,3,4,5,6,7]. If a > b the function should return an empty list.


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


% 18. Create a function that takes two sorted lists and merges them into a single sorted list. 
%       For example, for the input [0,2,4] and [1,3,5] the function should return [0,1,2,3,4,5].


% 19. Create a function that takes a list of integers and returns a pair with the least and greatest elements in the list. 
%       For example for the list [0,1,2,3,4] the function should return (0,4).


% 20 .Create a function that takes a list and an element and removes all copies of this element from the list. 
%       For example, for the input [a,b,c,a,d,a,e] and a, the function should return [b,c,d,e].