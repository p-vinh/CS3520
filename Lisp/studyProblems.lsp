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


; Extract a slice from a list.
; Given two indices, I and K, the slice is the list containing the elements
; between the I'th and K'th element of the original list (both limits included).
;Start counting the elements with 1.

; (slice '(a b c d e f g h i k) 3 7)
; (C D E F G)

(defun slice (lst start end)
	(if (< (length lst) start)
		lst

		(slice-h (nthcdr (- start 1) lst) end start)
	)
)

(defun slice-h (lst end cnt)
	(if (null lst)
		lst
		(if (= end cnt)
			(cons (car lst) nil)
			(cons (car lst) (slice-h (cdr lst) end (incf cnt)))
		)
	)
)
