;; That takes a list as an argument and returns true if one of its elements is a list.

(defun checkL (lst)
    (if (null lst)
        nil
        (if (listp (car lst))
            t
            (checkL (cdr lst))  
        )
    )
)


;; That takes a positive integer and prints that many dots using recursion.
(defun dots (num)
    (write "*")
    (if (> num 1)
        (dots (- num 1))
    )
)

;; Works exactly as the one in problem (2) but uses iteration instead.

(defun dots-i (num)
    (do ((i 0 (+ i 1))
        )
        ((>= i num) T)
        (write "*")
    )
)   

;; Takes a list and a symbol as arguments and returns the number of times
;; the symbol happens in the list using recursion.
(defun symbol-h (lst sym acc)
    (if (null lst)
        acc
        (if (= sym (car lst))
            (symbol-h (cdr lst) sym (+ acc 1))
            (symbol-h (cdr lst) sym acc)
        )
    )
)

(defun symb (lst sym)
    (if (null lst)
        0
        (symbol-h lst sym 0)
    )
)

;; Works exactly as the one in problem (4) but uses iteration instead.
(defun symb-i (lst sym)
    (let ((acc 0))
        (do ((i 0 (+ i 1)))
            ((>= i (length lst)) acc)
            (if (eq sym (nth i lst))
                (setq acc (+ acc 1))
            )    
        )
    )
)

;; This uses do list
; (defun symb-i (lst sym)
;     (let ((acc 0))
;         (dolist (elem lst acc)
;         (if (eq sym elem)
;             (setq acc (1+ acc))
;             )
;         )
;     )
; )

;; Returns the least element of a list. WIP if you can't use sort

(defun least (lst)
    (if (null lst)
        nil
        (car (sort lst #'<))
    )
)

;; Takes a list and returns that is the reverse of the input list.
;; Done recursively
(defun rev-h (lst acc)
    (if (null lst)
        acc
        (rev-h (cdr lst) (cons (car lst) acc))
    )
)
(defun rev (lst)
    (rev-h lst nil)
)

;; Takes a list of integers and returns a 
;; dotted list with the least and greatest numbers.

(defun min-max-helper (dlst lst)
    (if (null lst)
        dlst
        (let ((elm (car lst)))
            (if (< elm (car dlst))
                (min-max-helper (cons elm (cdr dlst)) (cdr lst))
                (if (> elm (cdr dlst))
                    (min-max-helper (cons (car dlst) elm) (cdr lst))
                    (min-max-helper dlst (cdr lst))
                )
            )
        )
    )
)

(defun min-max (lst)
    (if (null lst)
        nil
        (if (null (cdr lst))
            (cons (car lst) nil)
            (min-max-helper (cons (car lst) (car (cdr lst))) (nthcdr 2 lst))
        )
    )
)

;; Supposing sets are represented as lists, takes a list and computes the Power Set of the set it represents as a list. For example, the set {0,1}  would be represented as:
;; (0 1)
;; then the output would be: (nil (0) (1) (0 1)).
;; Tail recursive

(defun is-member (x s)
	(if (null s)
		nil
		(or (eql x (car s)) (is-member x (cdr s)))
	)
)

(defun l-union (s1 s2)
	(if (null s1)
		s2
		(if (null s2)
			s1

			(let ((x (car s1)))
				(l-union (cdr s1)
						(if (not (is-member x s2))
							(cons x s2)
							s2
							)
				)
			)
		)
	)
)


(defun proj-union-helper (x s acc)
	(if (null s)
		acc
		(proj-union-helper x (cdr s) (cons (cons x (car s)) acc))
	)
)

(defun proj-union (x s)
	(proj-union-helper x s nil)
)

(defun power (lset)
	(if (null lset)
		(list nil)
		(let ((elm (car lset))
			(step-pow (power (cdr lset))))
		
			(l-union (proj-union elm step-pow) step-pow)
		)
	)
)



;; Takes an integer i and a list and returns a list that is the result of cycling the input list i times. 
;; For example, if the inputs are:
;; ((1 2 3 4 5 6 7) 3)
;; then the output is: (4 5 6 7 1 2 3).
(defun cycle (lst num)
	(if (= num 0)
		lst
		(cycle (append (last lst) (butlast lst)) (- num 1))
	)
)

;; Takes a list and returns a list in which every element of the input has 
;; been duplicated: (1 2 3) -> (1 1 2 2 3 3).
(defun dup (lst)
    (if (null lst)
        lst
        (cons (car lst) (cons (car lst) (dup (cdr lst))))
    )
)