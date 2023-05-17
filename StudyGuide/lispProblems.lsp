;; 1. Create a function that computes x^y.
(defun pow (x y)
	(if (= y 0)
		1
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
;;	  following recursive definition: 0^2 = 0 , n^2 = (n-1) + n + n - 1.

(defun square (n)
	(if (= n 0)
		0
		(+ (square (- n 1)) n n -1)
	)
)



;; 3. Create a function that takes a list of pairs of integers, and orders the elements of each pair in non-increasing order.
;;	  For example, the list [(2,1) , (3,2) , (6,1)] will result in the list [(1,2) , (2,3) , (1,6)].
;;	  Hint: use dotted lists for the pairs in Lisp, and for Prolog you will have to define a relation pair(X,Y).

(defun listOrder (lst)
	(if (null lst)
		lst
		(cons (sortP (car lst)) (listOrder (cdr lst)))
	)
)

(defun sortP (pair)
	(let ((frst (car pair))
		  (secnd (cdr pair)))

		  (if (> frst secnd)
		  	(cons secnd frst)
			(cons frst secnd)
		  )
	)
)

;; 4. Create a function that takes a list of integers and returns a pair consisting of the sum of the numbers in even positions and the sum of the numbers in odd positions.
;;	  For example, for the list [1,2,3,4] the function should return (4,6).

(defun sumPos (lst)
	(if (null lst)
		0
		(sumPos-h lst 0 0 0)
	)
)

(defun sumPos-h (lst pos even odd)
	(if (null lst)
		(cons even (cons odd nil))
		(if (evenp pos)
			(sumPos-h (cdr lst) (+ pos 1) (+ even (car lst)) odd)
			(sumPos-h (cdr lst) (+ pos 1) even (+ odd (car lst)))
		)
	)

)

;; 5. Create a function that takes a list of pairs of integers and returns a list with the sum of the elements of every pair.
;;	  For example, for the list [(1,2) , (3,4) , (5,6)] the function should return [3,7,11].

(defun sumOfPairs (lst)
	(if (null lst)
		nil
		(cons (sumPair (car lst) 0) (sumOfPairs (cdr lst)))
	)
)

(defun sumPair (lst sum)
	(if (null lst)
		sum
		(sumPair (cdr lst) (+ sum (car lst)))
	)
)

;; 6. Create a function that takes a list of pairs of integers and returns a pair with the sum of the elements in the first position and the sum of the elements in the second position.
;;	  For example, for the list [(1,2) , (3,4) , (5,6)] the function should return (9,12).


(defun sumPairPos (lst)
	(sumPairPos-h lst 0 0)
)

(defun sumPairPos-h (lst sumF sumS)
	(if (null lst)
		(cons sumF (cons sumS nil))
		(sumPairPos-h (cdr lst) (+ (caar lst) sumF) (+ (cadar lst) sumS))
	)

)

;; 7. Polynomials may be represented as lists of integer, where each integer is the coefficient of the corresponding monomial.
;;	  For example, x^3 + 3x - 7 can be represented as [1,0,3,7]. Create a function that takes a polynomial as a list and evaluates the polynomial at a given point x_0.
;;	  Hint: use the function from problem (1).

(defun polynomial (lst x)
	(if (null lst)
		0
		(polynomial-h lst x 0 0)
	)
)

(defun polynomial-h (lst x sign sum)
	(if (null lst)
		sum
		(if (= (car lst) 0)
			(polynomial-h (cdr lst) x 0 sum)
			(let ((var (pow x (- (length lst) 1))))
				(if (= (mod sign 2) 0)
					(polynomial-h (cdr lst) x 1 (+ (* (car lst) var) sum))
					(polynomial-h (cdr lst) x 1 (- sum (* (car lst) var)))
				)
			)
		)
	)
)

;; 8. Create a function that eliminates all duplicate elements from a list.
;;	  For example, for the list [a,b,b,a,c,b,c,c,d,a,d] the function should return [a,b,c,d].

(defun removeDuplicates (lst)
	(removeDuplicates-h lst nil)
)

(defun removeDuplicates-h (lst acc)
	(if (null lst)
		(reverse acc)
		(let ((newLst (removeLetter (cdr lst) (car lst) (cons (car lst) nil))))
			(removeDuplicates-h (cdr newLst) (cons (car newLst) acc))
		)
	)
)

;; Removes a letter from the list
(defun removeLetter (lst x acc)
	(if (null lst)
		(reverse acc)
		(if (equal x (car lst))
			(removeLetter (cdr lst) x acc)
			(removeLetter (cdr lst) x (cons (car lst) acc))
		)
	)
)


;; 9. Create a function that packs consecutive duplicate elements of a list into sublists.
;;	  For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a] , [b,b] , [a] , [c] , [b] , [c,c] , [d] , [a] , [d]]

(defun pack (lst)
	(if (null lst)
		nil
		(cons (pack-h lst (car lst) nil) (pack (go-to-pos lst)))
	)
)

(defun pack-h (lst x acc)
	(if (null lst)
		acc
		(if (equal x (car lst))
			(pack-h (cdr lst) x (cons (car lst) acc))
			acc
		)
	)
)

(defun go-to-pos (lst)
	(if (equal (car lst) (cadr lst))
		(go-to-pos (cdr lst))
		(cdr lst)
	)
)

;; 10. Create a function that packs all duplicate elements of a list into sublists.
;;	   For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [[a,a,a] , [b,b,b] , [c,c,c] , [d,d]].

(defun packDups (lst)
	(if (null lst)
		nil
		(cons (packDups-h lst nil) (packDups (go-to-pos lst)))
	)
)

(defun packDups-h (lst acc)


)



;; 11. Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position.
;;	   For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].

;; 12. Create a function that decodes length encoding.
;;	   For example, the code list [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)] should return [a,b,b,a,c,b,c,c,d,a,d].

;; 13. Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b. 
;;	   For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.


;; 14. Create a version of the function in problem (13) that when a > b it doesn't return an empty list, but the sublist that starts at a and ends in b wrapping around the end of the list.
;;	   For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3, the function should return [6,7,1,2,3,4].

;; 15. Create a a function that takes a pair of integers a and b, and returns a list with every integer between a and b.
;;	   For example, for the input 2 and 7 the function should return the list [2,3,4,5,6,7]. If a > b the function should return an empty list.

;; 16. Create a function that takes a list of a number k and a list, and returns a list of lists with all the combinations of k distinct elements from the list.
;;	   For example, for integer 2 and the list [a,b,c] the function should return [[a,b] , [a,c] , [b,c]].

; This is the top function. Takes a list (set) and a number and returns all possible
; combinations of size k from the given set.
(defun combination (l k)
    (cond
      ((= k 0) (list nil))
      ((= k (length l)) (list l))
      (t
        (let ((combkm1 (combination l (decf k)))) ; Here is the recursive call. Build all combinations of size k-1.
          (combination-h l combkm1 nil)           ; This helper aids in building the inductive case.
        )
      )
    )
)

; The inductive case function. Given all combinations of size k-1, to obtain combinations of size k
; simply every element of the original set onto the possible combinations. The trick here is, since we
; representing sets with lists, take care to eliminate duplicates (or rather make sure you don't add them).
; 
; l : the original set
; pcomb : all combinations of size k-1
; acc : the accumulator (this function is tail-recursive).
(defun combination-h (l pcomb acc)
  (if (null l)
    acc
    (let ((proj-u (proj-union (car l) pcomb nil))
         )
      (combination-h (cdr l) pcomb (sp-union proj-u acc))
    )
  )
)

; We can't use the lisp 'union' function here because, for example,
; for arguments a and (a), it generates (a) (which is correct), but we don't
; want to add this because this is not a new combination. So this function works
; just like lisp's 'union' function, except it doesn't add the above spurious combination.
(defun proj-union (x s acc)
  (if (null s)
    acc
    (proj-union x
                (cdr s) 
                (if (not (member x (car s)))
                  (cons (cons x (car s)) acc)
                  acc
                )
    )
  )
)

; This function is a special union function that takes two sets of sets
; and computes the union. We need this because lisp's 'union' ony works
; if the sets elements are atoms. So to union sets of sets we need a brand
; new function (Note: this only works if we are working with sets of sets of atoms,
; that is, only one nesting level, for sets of sets of sets, we would need another function.
;
; The reason this is extra complicated is that we really can't use structural equivalence because
; even though the lists (1 2) and (2 1) represent the same set, they are structurally different lists
; so (equal '(1 2) '(2 1)) returns nil. So we have to manually check that both lists contain the same
; elements.
(defun sp-union (s1 s2)
  (cond
    ((null s1) s2)
    ((null s2) s1)
    (t (sp-union (cdr s1) (if (not (sp-member (car s1) s2))
                            (cons (car s1) s2)
                            s2
                          )
       )
    )
  )
)

; Checks whether set x is a member of set of sets s.
(defun sp-member (x s)
  (if (null s)
    nil
    (if (set-eq x (car s))
      t
      (sp-member x (cdr s))
    )
  )
)

; This is how we define set equality. The subsetp function checks that
; the second list contains all elements from the first list.
(defun set-eq (s1 s2)
  (and (subsetp s1 s2) (subsetp s2 s1))
)


;; 17. Create a function that takes a list and returns a pair with two lists: one with elements that are less than or equal to the first element,
;;	   and the other with the elements that are greater than the first element.
;;	   For example, for the list [3,1,4,2,0,5] the function should return ([1,2,0,3] , [4,5]).

(defun partition (lst)
	(partition-h (car lst) (cdr lst) nil nil)
)

(defun partition-h (pivot lst lesser greater)
	(if (null lst)
		(cons (reverse (cons pivot lesser)) (cons (reverse greater) nil))
		(if (> pivot (car lst))
			(partition-h pivot (cdr lst) (cons (car lst) lesser) greater)
			(partition-h pivot (cdr lst) lesser (cons (car lst) greater))
		)
	)
)
;; 18. Create a function that takes two sorted lists and merges them into a single sorted list.
;; 	   For example, for the input [0,2,4] and [1,3,5] the function should return [0,1,2,3,4,5].

;; 19. Create a function that takes a list of integers and returns a pair with the least and greatest elements in the list.
;;	   For example for the list [0,1,2,3,4] the function should return (0,4).

;; 20.Create a function that takes a list and an element and removes all copies of this element from the list.
;;	  For example, for the input [a,b,c,a,d,a,e] and a, the function should return [b,c,d,e].

(defun removeDups (lst x)
	(if (null lst)
		nil
		(removeDups-h lst x nil)
	)
)

(defun removeDups-h (lst elm acc)
	(if (null lst)
		(reverse acc)
		(if (equal elm (car lst))
			(removeDups-h (cdr lst) elm acc)
			(removeDups-h (cdr lst) elm (cons (car lst) acc))
		)
	)
)