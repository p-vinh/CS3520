revrs([], A, R) :- R = A.
revrs([H|T], A, R) :- B = [H|A], revrs(T, B, R).