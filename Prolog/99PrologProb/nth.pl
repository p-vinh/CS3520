% Find the K'th element of a list.
% The first element in the list is number 1.
% Example:
% ?- element_at(X,[a,b,c,d,e],3).
% X = c

element_at(X, [X | _], 1).
element_at(X, [_|T], N) :- N > 1, S is N - 1, element_at(X, T, S).


% Answer:

% P03 (*): Find the K'th element of a list.
% The first element in the list is number 1.

% element_at(X,L,K) :- X is the K'th element of the list L
%    (element,list,integer) (?,?,+)

% Note: nth1(?Index, ?List, ?Elem) is predefined

% element_at(X,[X|_],1).
% element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).
