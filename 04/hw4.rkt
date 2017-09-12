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