;; 1. Create a function that computes x^y.
(defun pow (x y)
	(if (= y 0)
		x
		(pow-h x y 1)
	)
)

(defun pow-h (x y acc)
	(if (= y 0)
		acc
		(pow-h x (- y 1) (* acc x))
	)
)
;; 2. Create a function that computes x^2 without using multiplication by using the
;;	  following recursive definition: 0^2 = 0 , n^2 = (n-1)^2 + n + n - 1.



;; 3. Create a function that takes a list of pairs of integers, and orders the elements of each pair in non-increasing order. For example, the list [(2,1) , (3,2) , (6,1)] will result in the list [(1,2) , (2,3) , (1,6)]. Hint: use dotted lists for the pairs in Lisp, and for Prolog you will have to define a relation pair(X,Y).
;; 4. Create a function that takes a list of integers and returns a pair consisting of the sum of the numbers in even positions and the sum of the numbers in odd positions. For example, for the list [1,2,3,4] the function should return (4,6).
;; 5. Create a function that takes a list of pairs of integers and returns a list with the sum of the elements of every pair. For example, for the list [(1,2) , (3,4) , (5,6)] the function should return [3,7,11].
;; 6. Create a function that takes a list of pairs of integers and returns a pair with the sum of the elements in the first position and the sum of the elements in the second position. For example, for the list [(1,2) , (3,4) , (5,6)] the function should return (9,12).
;; 7. Polynomials may be represented as lists of integer, where each integer is the coefficient of the corresponding monomial. For example, x^3 + 3x - 7 can be represented as [1,0,3,7]. Create a function that takes a polynomial as a list and evaluates the polynomial at a given point x_0. Hint: use the function from problem (1).
;; 8. Create a function that eliminates all duplicate elements from a list. For example, for the list [a,b,b,a,c,b,c,c,d,a,d] the function should return [a,b,c,d].
;; 9. Create a function that packs consecutive duplicate elements of a list into sublists. For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a] , [b,b] , [a] , [c] , [b] , [c,c] , [d] , [a] , [d]]
;; 10. Create a function that packs all duplicate elements of a list into sublists. For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a,a,a] , [b,b,b] , [c,c,c] , [d,d]].
;; 11. Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position. For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].
;; 12. Create a function that decodes length encoding. For example, the code list [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)] should return [a,b,b,a,c,b,c,c,d,a,d].
;; 13. Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b. For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.
;; 14. Create a version of the function in problem (13) that when a > b it doesn't return an empty list, but the sublist that starts at a and ends in b wrapping around the end of the list. For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3, the function should return [6,7,1,2,3,4].
;; 15. Create a a function that takes a pair of integers a and b, and returns a list with every integer between a and b. For example, for the input 2 and 7 the function should return the list [2,3,4,5,6,7]. If a > b the function should return an empty list.
;; 16. Create a function that takes a list of a number k and a list, and returns a list of lists with all the combinations of k distinct elements from the list. For example, for integer 2 and the list [a,b,c] the function should return [[a,b] , [a,c] , [b,c]].
;; 17. Create a function that takes a list and returns a pair with two lists: one with elements that are less than or equal to the first element, and the other with the elements that are greater than the first element. For example, for the list [3,1,4,2,0,5] the function should return ([1,2,0,3] , [4,5]).
;; 18. Create a function that takes two sorted lists and merges them into a single sorted list. For example, for the input [0,2,4] and [1,3,5] the function should return [0,1,2,3,4,5].
;; 19. Create a function that takes a list of integers and returns a pair with the least and greatest elements in the list. For example for the list [0,1,2,3,4] the function should return (0,4).
;; 20 .Create a function that takes a list and an element and removes all copies of this element from the list. For example, for the input [a,b,c,a,d,a,e] and a, the function should return [b,c,d,e].