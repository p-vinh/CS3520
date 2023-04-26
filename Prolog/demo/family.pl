facto(0, 1).

facto(N, R) :- M is N-1, facto(M, A), R is A * N.


fibo(1, 1) :- !.
fibo(2, 1) :- !.

fibo(N, R) :- S is N - 1, T is N - 2, fibo(S, A), fibo(T, B), R is A + B.





/* fibo(3, R)
	S = 2 -> fibo(2, A) -> fibo(2, 1).
	T = 1 -> fibo(1, B) -> fibo(1, 1).

	R = 2

	fibo(5, R)
	S = 4 fibo(4, A)
		S = 3 fibo(3, A)
			fibo(2, 1). 1
			fibo(1, 1). 1
		T = 2 fibo(2, B)
			fibo(2, 1). 1
	T = 3 fibo(3, B)
			fibo(2, 1). 1
			fibo(1, 1) 1

	R = 5?
 */