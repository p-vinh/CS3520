% Find the K'th element of a list.
% The first element in the list is number 1.
% Example:
% ?- element_at(X,[a,b,c,d,e],3).
% X = c


element_at(X, [X], 0).
element_at(X, [H|T], N) :- S is N - 1, element_at(H, T, S).