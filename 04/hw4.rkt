#lang racket
;;;1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low
            (sequence (+ low stride)
                      high
                      stride))))

;;;2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix))
         xs))

;;;3
(define (list-nth-mod xs n)
  (cond [(negative? n) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

;;;4
(define (stream-for-n-steps stream number)
  (cond [(= number 0) '()]
        [(> number 0)
         (let ([p (stream)])
           (cons (car p) (stream-for-n-steps (cdr p) (- number 1))))]))


;;;5
(define funny-number-stream
  (letrec ([negate-five (lambda (x)
                          (if (zero? (remainder x 5))
                              (- x)
                              x))]
           [natural (lambda (x)
                      (cons (negate-five x)
                            (lambda() (natural (+ x 1)))))])
  (lambda () (natural 1))))
                                                       
;(stream-for-n-steps funny-number-stream 6)

;;;6
;this is cumbersome!!!!
;(define dan-then-dog
;  (letrec ([alternate (lambda (x)
;                     (if (eq? x "dan.jpg")
;                         (cons (cons "dog.jpg" "dog.jpg")
;                               (lambda() (alternate "dog.jpg")))
;                         (cons (cons "dan.jpg" "dan.jpg")
;                               (lambda() (alternate "dan.jpg")))))])
;    (lambda () (alternate "dan.jpg"))))

(define dan-then-dog
  (letrec ([dan (lambda() (cons "dan.jpg" dog))]
           [dog (lambda() (cons "dog.jpg" dan))])
    dan))


;;;7
(define (stream-add-zero s)
  (letrec ([f (lambda (x)
                (cons (cons 0 (car x)) (lambda () (f ((cdr x))))))])
    (lambda () (f (s)))))

;;;8
(define (circle-lits xs ys)
  (letrec ([pr (lambda (n)
                 (cons (list-nth-mod xs n)
                       (list-nth-mod ys n)))]
           [f (lambda (x)
                (cons (pr x)
                      (lambda () (f (+ x 1)))))])
    (lambda () (f 0))))

;;;9
;;test
(define (vector-assoc v vec)
  (letrec ([f (lambda (n)
                (if (>= n (vector-length vec))
                    #f
                    (let ([n-th (vector-ref vec n)])
                      (if (and (pair? n-th) (equal? (car n-th) v))
                          n-th
                          (f (+ n 1))))))])
    (f 0)))

;;;10
(define (cached-assoc xs n)
  (letrec ([memo (make-vector n #f)]
           [pos 0])
    (lambda (v)
      (or (vector-assoc v memo)
          (let ([new-ans (assoc v xs)])
            (and new-ans
                 (begin
                   (vector-set! memo pos new-ans)
                   (set! pos (remainder (+ pos 1) n))
                   new-ans)))))))

                        
           
  





  