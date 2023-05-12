% Find the last element of a list:
% ?- list_last([1,2,3],L).
% L=3.
list_last([], _).
list_last([L], L).
list_last([H|T], L) :- list_last(T, L).

% Find the nth element of a list:
% ?- list_nth(0,[1,2,3],N).
% N=1.

% Find the size of a list:
% ?- list_size([1,2,3],S).
% S=3.

% Determine whether a list is a palindrome:
% ?- is_palindrome([t,e,n,e,t]).
% true.

% Split a list in two parts given the length of the first part:
% ?- split_n(1,[1,2,3],L1,L2).
% L1=[1].
% L2=[2,3].

% Determine whether a given number is prime:
% ?- is_prime(7).
% true.

% Determine whether a number is perfect:
% ?- is_perfect(6).
% true.
