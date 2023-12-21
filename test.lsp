;; 14. Create a version of the function in problem (13) that when a > b it doesn't return an empty list, but the sublist that starts at a and ends in b wrapping around the end of the list.
;;		For example, for the list [1,2,3,4,5,6,7] and integers 5 and 3, the function should return [6,7,1,2,3,4].

(defun sublist-wrap (lst a b)
	(if (null lst)
		nil
		(if (= a 0)
			(nthcdr b lst)
			(cons (car lst) (sublist-wrap (cdr lst) (- a 1) b))
		)
	)
)

;; 12. Create a function that decodes length encoding. For example, the code list [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)] should return [a,b,b,a,c,b,c,c,d,a,d].

(defun decode (lst)
	(if (null lst)
		nil
		(append (decode-h (caar lst) (cadar lst)) (decode (cdr lst)))
	)
)

(defun decode-h (cnt elm)
	(if (= cnt 0)
		nil
		(cons elm (decode-h (- cnt 1) elm))
	)
)


;; 9 Create a function that packs consecutive duplicate elements of a list into sublists. For example, for the list [a,b,b,a,c,b,c,c,d,a,d], 
;; the function should return [[a] , [b,b] , [a] , [c] , [b] , [c,c] , [d] , [a] , [d]]
	(defun pack (lst)
		(if (null lst)
			nil
			(cons (pack-h lst (car lst) nil) (pack (go-to-pos lst)))
		)
	)

	(defun pack-h (lst x acc)
		(if (null lst)
			acc
			(if (equal (car lst) x)
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

;; 11 Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position.
;; For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].

(defun encodingL (lst)
	(if (null lst)
		nil
		(cons (encoding-h lst (car lst) nil) (encodingL (go-to-pos lst)))
	)
)

(defun encoding-h (lst x acc)
	(if (null lst)
		(cons (length acc) (cons (car acc) nil))
		(if (equal (car lst) x)
			(encoding-h (cdr lst) x (cons (car lst) acc))
			(cons (length acc) (cons (car acc) nil))
		)
	)

)





