;; Flips alternate elements of a list. That is, if the input is (a_1 a_2 ... a_n)
;; then the output is (a_2 a_1 a_4 a_3 ... a_n a_n-1).
;; If n is odd, a_n remains at the end. Solved with recursion

(defun flip (lst)
	(if (or (null lst)
		 (null (cdr lst)))  ; checks if next element is nil. Base Case for odd list
		 lst
		 ;; Creates a list with cons. Takes two elements and swaps.
		 ;; Unwinds when base case is true, therefore it does not need append.
		(cons (cadr lst) (cons (car lst) (flip (cddr lst))))
	)
)



;; ===Version with a helper function and the append function====
; (defun flip-h (lst result)
; 	(if (or (null lst)
; 			 (null (cdr lst))) ; checks if next element is nil.
; 		;; appends the odd number to the end. When the list is even it will ignore the nil
; 		(append result lst)

; 		;; lst: gets the list beyond the second element 
; 		;; result: swaps the first element with the second element in the list and appends the two lists together
; 		(flip-h (cddr lst) (append result (list (car (cdr lst)) (car lst))))	
; 	)
; )


;; Given an input list L and an integer i, returns a copy of L with the ith element deleted.
;; If the length of L is less than i, return L. Solved without reverse, instead uses recursion
(defun remove-i (lst i)
	(if (null lst)
		lst
		(if (>= (length lst) i)
			(if (= i 1)
				(cdr lst)
				(cons (car lst) (remove-i (cdr lst) (- i 1)))
			)
			lst
		)
	)
)

;; ====Version with reverse function====
; (defun remove-h (lst i nList)
; 	(if (null lst)
; 		(reverse nList)
; 		(let ((firstE (car lst)))
; 			(if (= i 1)
; 				;; if i == 1 increment acc and leave the new list alone.
; 				(remove-h (cdr lst) (- i 1) nList)
; 				;; if i != 1 increment acc and take the first element in the list and add it to the new list
; 				(remove-h (cdr lst) (- i 1) (cons firstE nList))
; 			)
; 		)
; 	)
; )
; (defun remove-i (lst i)
; 	(if (null lst)
; 		lst
; 		(if (>= (length lst) i)
; 			(remove-h lst i (list))
; 			lst
; 		)
; 	)
; )


;; Takes a list of integers (a_1 a_2 ... a_n) and computes the product of all terms: (a_i - a_j), where i < j
;; that is, computes the product of all differences between elements, with the element appearing later on the list subtracted from the element appearing first.
;; If the list is empty, the function returns 1.

(defun diffs (firstE acc mult)
	;; returns accumulator once the multipler list is null
	(if (null mult)
		acc
		;; calls diffs until mult is empty.
		;; Takes the first element and gets the product of diff of that first element
		(diffs firstE (* (- firstE (car mult)) acc) (cdr mult))
	)
)

(defun product-of-diff (lst)
	(if (null lst)
		1 					; returns if list is empty
		(if (null (cdr lst)) 
			1				; returns if list only has 1 element
			;; multiplies the resulting accumulator from diff using the first element.
			;; recursively calls product-of-diff for the rest of the list.
			(* (diffs (car lst) 1 (cdr lst)) (product-of-diff (cdr lst)))
		)
	)
)

