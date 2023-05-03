;; Extract a slice from a list.
;; Given two indices, I and K, the slice is the list containing the elements 
;; between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

;; Example:
;; * (slice '(a b c d e f g h i k) 3 7)
;; (C D E F G)


(defun slice (lst start end)
	(if (< (length lst) start)
		lst
		(slice-h (nthcdr (- start 1) lst) nil end)
	)
)

(defun slice-h (lst acc end)
	(if (null lst)
		lst
		(if (= end 1)
			nil
			(cons (car lst) (slice-h (cdr lst) acc (- end 1)))
		)
	)
)

;; Pack consecutive duplicates of list elements into sublists.
;; If a list contains repeated elements they should be placed in separate sublists.

;; Example:
;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))

(defun pack (lst)
	(if (null lst)
		lst
		(cons (pack-h lst) (pack (jump-to lst)))
	)
)

(defun jump-to (lst)
	(if (null (cdr lst))
		nil
		(if (equal (car lst) (cadr lst))
			(jump-to (cdr lst))
			(cdr lst)
		)
	)

)

(defun pack-h (lst)
	(if (null (cdr lst))
		(list (car lst))
		(if (equal (car lst) (cadr lst))
			(cons (car lst) (pack-h (cdr lst)))
			(list (car lst))
		)
	)
)

;; Flatten a nested list structure.
;; Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

;; Example:
;; * (my-flatten '(a (b (c d) e)))
;; (A B C D E)

;; (cons 'a' my-flatten (b (c d) e))
;;		(cons 'b' my-flatten ((c d) e))
;;			(cons my-flatten (c d) my-flatten (e))
;;            			|				|
;;			(cons 'c' MF(d))       (cons 'e' nil)
;;			(cons 'c' (cons 'd' nil))

(defun my-flatten (lst)
	(if (null lst)
		nil
		(if (listp (car lst))
			(append (my-flatten (car lst)) (my-flatten (cdr lst)))
			(cons (car lst) (my-flatten (cdr lst)))
		)
	)
)

(defun minT (lst)
	(if (null lst)
		nil
		(minT-h lst (car lst))
	)
)

(defun minT-h (lst cMin)
	(if (null lst)
		cMin
		(if (< (car lst) cMin)
			(minT-h (cdr lst) (car lst))
			(minT-h (cdr lst) cMin)
		)
	)
)

(defun lstofL (num lst)
	(if (null lst)
		nil
		(mapcar (lambda (x) (cons num x)) lst)
		;(cons (cons num lst) (lstofL num (cdr lst)))
	)

)

