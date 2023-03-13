; Write a function that flattens a list, for example:
; > (flatten '(1 (2) 3 (4 (5))))
;   (1 2 3 4 5)


(defun flatten (lst)
    (if (null lst)
        lst
        (if (listp (car lst))
            (append (flatten (car lst)) (flatten (cdr lst)))
            (cons (car lst) (flatten (cdr lst)))
        )
    )
)

;(write (flatten '(1 (2) 3 (4 (5)))))

; x::[rest] -> is x a list? no: (cons x (flatten (cdr lst)))
;                           yes: (append (flatten x) (flatten (cdr lst)))


; ((1 2) 3 (4 5))
;    |
; (flatten (1 2))  -   (flatten (3 (4 5)))
;        |                       |
;        |             (flatten (3))  -  (flatten (4 5))
;        |                      |
;       (1 2)   - append -   (3 4 5)
;                    |
;               (1 2 3 4 5)


; Write a function that packs consecutive duplicate elements into sublists.
; For example:
; > (pack '(1 2 2 3 4 4 4 5 5))
;  ((1) (2 2) (3) (4 4 4) (5 5))

(defun pack-elm (x lst acc)
    (if (equal x (car lst))
        (pack-elm x (cdr lst) (cons x acc))
        (cons x acc)
    )
)

(defun jump-to-diff (x rst)
    (if (equal x (car rst))
        (jump-to-diff x (cdr rst))
        rst
    )
)

(defun pack (lst)
    (if (null lst)
        lst
        (let ((x (car lst))
              (rst (cdr lst))
            )
            (cons (pack-elm x rst nil) (pack (jump-to-diff x rst)))
        )
    )
)

; (write (pack '(1 2 2 3 4 4 4 5 5)))
; x::[rest] -> (x) (equal x (car rest))? -> (cons (car rest) x) <- keep doing this until front of rest is not x


; Write a function that counts the consecutive elements
; lst contains identical elements, e.g.: (1 1 1 1 1)
(defun compress (lst)
    (cons (length lst) (cons (car lst) nil))
)

(defun encode (lst)
    (mapcar #'compress (pack lst))
)

(write (encode '(1 2 2 3 4 4 4 5 5)))