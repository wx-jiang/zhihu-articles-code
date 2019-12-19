#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x)))))

(define count
  (lambda (x)
    (cond
      [(< x 0) #f]
      [(eqv? x 0) #t]
      [else (count (- x 3))])))

(define list-of-atom?
  (lambda (s)
    (cond
      [(null? s) #t]
      [(not (pair? s)) #f]
      [(atom? (car s)) (list-of-atom? (cdr s))]
      [else #f])))

(define member?
  (lambda (a lat)
    (cond
      [(null? lat) #f]
      [(eq? (car lat) a)]
      [else (member? a (cdr lat))])))