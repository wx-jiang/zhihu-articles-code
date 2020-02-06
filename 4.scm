#lang racket

(define my-cons
  (lambda (a b)
    (lambda (x)
      (cond
        ((eqv? x 1) a)
        ((eqv? x 2) b)
        (else (print "wrong"))))))

(define my-car
  (lambda (the-cons)
    (the-cons 1)))

(define my-cdr
  (lambda (the-cons)
    (the-cons 2)))

;(define s (my-cons 15 (my-cons 16 (my-cons 17 '()))))
;(my-car s)
;(my-car (my-cdr s))