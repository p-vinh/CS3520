% Find the number of elements of a list.

lengthL([], N) :- N is 0.
lengthL([_ | T], N) :- lengthH([_ |T], 0, R),  N is R.
lengthH([], N, R) :- R = N.
lengthH([_| T], N, R) :- N1 is N + 1, lengthH(T, N1, R).


% lengthL([], 0) :- N is 0.
% lengthL([_| T], N) :- lengthL(T, N1), N is N1 + 1.



% Answer
% P04 (*): Find the number of elements of a list.

% my_length(L,N) :- the list L contains N elements
%    (list,integer) (+,?) 

% Note: length(?List, ?Int) is predefined

% my_length([],0).
% my_length([_|L],N) :- my_length(L,N1), N is N1 + 1.