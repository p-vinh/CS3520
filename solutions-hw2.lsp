;; Write a function palindromep that takes a list and returns t if the list is a palindrome, i.e., 
;; the sequence of elements is the same when read left-to-right or right-to-left:
;; > (palindromep '(1 2 3 2 1))
;; T
;; >(palindromep '(a c f t))
;; NIL




;; Write a function occr that takes a list and returns a list of dotted pairs (also called an associative list)
;; consisting of every element in the list and the times it occurs in the list:
;; > (occr '(1 2 1 2 3 4 2 4 1 3))
;; ((1 . 3) (2 . 3) (3 . 2) (4 . 2))



;; Write a function nodups that takes a list and returns a list with
;; any consecutive identical items removed:
;; > (nodups '(1 1 2 2 2 3 4 5 5))
;; (1 2 3 4 5)
;; >(nodups '(a a b b b a c c))
;; (a b a c)


(defun nodups (lst)
	;; return lst if it is empty
	(if (null lst)
		lst
		;; return the list if there is only 1 element
		(if (null (cdr lst))
			lst
			;; if the first and second element equal call nodups with cdr list
			(if (eq (car lst) (cadr lst))
				;; keeps going through the list until there isn't the same element
				(nodups (cdr lst))
				;; adds an item to a list and moves on to the next element
				(cons (car lst) (nodups (cdr lst)))
			)
		)		
	)
)

;; Write a function factorsL that takes a list of numbers and replaces every number with a list of its prime factors:
;; > (factors '(6 20 9 18))
;; ((2 3) (2 5) (3) (2 3))






;; Write a function dups that takes a list and a number and duplicates each element the number of times specified by the number argument:
;; > (dups '(1 2 3) 3)
;; (1 1 1 2 2 2 3 3 3)

(defun dups-h (lst num acc)
	(if (= num 0)
		acc
		(dups-h lst (- num 1) (cons (car lst) acc))
	)
)

(defun dups (lst num)
	(if (null lst)
		lst
		(if (< num 1)
			lst
			(append (dups-h lst num nil) (dups (cdr lst) num))
		)
	)
)