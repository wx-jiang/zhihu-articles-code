#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x))
         (not (null? x)))))

(define rember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) a) (cdr lat)]
      [else
       (cons (car lat)
             (rember a (cdr lat)))])))

(define firsts
  (lambda (l)
    (cond
      [(null? l) '()]
      [else
       (cons (car (car l))
             (firsts (cdr l)))])))

(define seconds
  (lambda (l)
    (cond
      [(null? l) '()]
      [else
       (cons (car (cdr (car l)))
             (seconds (cdr l)))])))

(define instead
  (lambda (old new l)
    (cond
      [(null? l) '()]
      [(eq? old (car l)) (cons new (cdr l))]
      [else
       (cons (car l)
             (instead old new (cdr l)))])))

(define insertL
  (lambda (old new l)
    (cond
      [(null? l) '()]
      [(eq? old (car l))
       (cons new (cons old (cdr l)))]
      [else
       (cons (car l)
             (insertL old new (cdr l)))])))

(define insertR
  (lambda (old new l)
    (cond
      [(null? l) '()]
      [(eq? old (car l))
       (cons old (cons new (cdr l)))]
      [else
       (cons (car l)
             (insertR old new (cdr l)))])))

(define l1 '())
(define l2 '(apple apple pear))
(define l3 '(pear pineapple water))
(define l4 '(ice cream with blueberry and raspberry))