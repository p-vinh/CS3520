
; Create a function that computes the length encoding of a list, which is a list of pairs with every elements and times it appears consecutively at a given position. 
; For example, for the list [a,b,b,a,c,b,c,c,d,a,d], the function should return [(1,a) , (2,b) , (1,a) , (1,c) , (1,b) , (2,c) , (1,d) , (1,a) , (1,d)].

; if first element of the cdr is the same as current element add 1 to accumulator
; if different add accumulator and current element to list

(defun lengthencoder (lst)
    (lengthencoder-h lst 1 '())
)

(defun lengthencoder-h (lst cnt acc)
    (if (null lst)
        (reverse acc)
        (if (eql (car lst) (car (cdr lst)))
            (lengthencoder-h (cdr lst) (+ 1 cnt) acc)
            (lengthencoder-h (cdr lst) 1 (cons (list cnt (car lst)) acc))
        )
    )
)

; Create a function that takes a list and two integers a and b and returns the sublist that starts on a and ends on b. 
; For example, for the list [1,2,3,4,5,6,7] and integers 3 and 5, the function should return [4,5,6]. If a > b then the function should return the empty list.

; if cnt is a then begin adding to list
; if cnt > b stop adding

(defun sublst (lst a b)
    (sublst-h lst a b 0 '())
)

(defun sublst-h (lst a b cnt acc)
(if (> a b)
    nil
     (if (> cnt b)
        (reverse acc)
        (if (>= cnt a)
            (sublst-h (cdr lst) a b (+ 1 cnt) (cons (car lst) acc))
            (sublst-h (cdr lst) a b (+ 1 cnt) acc)
        )
    )
)  
)

; Create a function that takes a number k and a list, and returns a list of lists with all the combinations of k distinct elements from the list. 
; For example, for integer 2 and the list [a,b,c] the function should return [[a,b] , [a,c] , [b,c]].
; start on 16

(defun elmlists (lst front num acc)
    (if (null lst)
        acc
        (elmlists (cdr lst) front num (cons (elmlists-h lst num (list front)) acc))
    )
)
(defun elmLists-h (lst num acc)
    (if (= num 0)
        (reverse acc)
        (if (null lst)
            nil
            (elmlists-h(cdr lst) (- num 1) (cons (car lst) acc))
        )
    )
)
