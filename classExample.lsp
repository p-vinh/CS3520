;; Create a function that returns true if it is a list

;; (defun containsL (lst)
;; 	(if (null lst)
;; 		nil
;; 		(if (listp lst)
;; 			t
;; 			(containsL (cdr lst))
;; 		)
;; 	)
;; )


;; Create a function that takes in a positive integer

(defun dots (n)
	(write "*")
	(if (= n 1)
		nil
		(dots (- n 1))
	)
)


;; function that takes in a list and a symbol. Counts the number of times it appears in the list
(defun occr-h (n lst acc)
	(if (null lst)
		acc
		(if (= n (car lst))
			(occr-h n (cdr lst) (+ acc 1))
			(occr-h n (cdr lst) acc)
			
		)
	)
)

(defun occr (n lst)	
	(occr-h n lst 0)
)


;; Example 5: Gets the min in the list
(defun minT-h (crL lst)
	(if (null lst)
		crL
		(if (< (car lst) crL)
			(minT-h (car lst) (cdr lst))
			(minT-h crL (cdr lst))
		)
	)
)

(defun minT (lst)
	(minT-h (car lst) (cdr lst))
)


;; Gets the reverse of the list
(defun reverse-h (lst nlst)
	(if (null lst)
		nlst
		(reverse-h (cdr lst) (cons (car lst) nlst))
	)
)

(defun rlst (lst)
	(reverse-h lst nil)
)


(defun counter ()
;;define i=0. update function. Test function.
	(do ((i 0 (+ i 1))) ((> i 9) 42)
		(format t "The current value of i is: ~A~%" i)
	)
)

(defun factorial (n)
	(progn
		(setf )
	)
)

;; Arrays

(make-array 3)
;> #(NIL NIL NIL)
;we use setf to store the array in a variable

;; best way to make an array because "my-array" has a pointer to the beginning of the array
(setf my-array (make-array 3))
;> #(NIL NIL NIL)


(setf (aref my-array 0) 42)
;> 42

my-array
;> #(42 NIL NIL)
