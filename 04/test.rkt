#lang racket
;;;1
(sequence 1 11 3)

;;;2
(string-append-map '["a"] "b")

;;;3
(list-nth-mod [list 1 2 3 4 5] 2)

;;;4
(define ones
  (lambda ()
    (cons 1 ones)))
(stream-for-n-steps ones 4)

;;;5
(stream-for-n-steps funny-number-stream 6)

;;;6
(stream-for-n-steps dan-then-dog 5)

;;;7
(stream-for-n-steps (stream-add-zero funny-number-stream) 6)

;;;8
(stream-for-n-steps (circle-lits '(1 2) '("a" "b")) 6)

;;;9
(vector-assoc 4 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1)))

;;;10
((cached-assoc (list (cons 1 2) (cons 3 4)) 3) 3)