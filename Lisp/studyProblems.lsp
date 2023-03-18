(defun dnth (lst x)
	(if (< (length lst) x)
		lst
		(dnth-h lst x 1)
	)
)

(defun dnth-h (lst x cnt)
	(if (null lst)
		lst
		(if (= x 1)
			(dnth-h (cdr lst) x 1)
			(cons (car lst) (dnth-h (cdr lst) x (incf cnt)))
		)
	)
)


(defun split (lst n)
	(if (< (length lst) n)
		lst
		(split-h lst n 1)
	)

)

(defun split-h (lst x cnt)
	(if (null lst)
		lst
		(if (= x cnt)
			(cons (car lst) (cdr lst))
			(cons (car lst) (split-h (cdr lst) x (incf cnt)))
		)
	)
)
