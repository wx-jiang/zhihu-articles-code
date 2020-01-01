#lang racket

(define fact
  (lambda (n)
    (if (eqv? n 0)
        1
        (* n (fact (- n 1))))))

(define fact-maker
  (lambda (procedure)
    (lambda (n)
      (if (eqv? n 0)
          1
          (* n ((procedure procedure) (- n 1)))))))

(define fact-2
  ((lambda (procedure)
     (lambda (n)
       (if (eqv? n 0)
           1
           (* n ((procedure procedure) (- n 1))))))
   (lambda (procedure)
     (lambda (n)
       (if (eqv? n 0)
           1
           (* n ((procedure procedure) (- n 1))))))))

;(define F
;  (lambda (n)
;    (if (eqv? n 0)
;        1
;        (* n ((procedure procedure) (- n 1))))))
;
;(define new-F
;  ((lambda (func-arg)
;     (lambda (n)
;       (if (eqv? n 0)
;           1
;           (* n (func-arg (- n 1))))))
;   (lambda (arg) ((procedure procedure) arg))))

(define fact-3
  ((lambda (procedure)
     ((lambda (func-arg)
        (lambda (n)
          (if (eqv? n 0)
              1
              (* n (func-arg (- n 1))))))
      (lambda (arg) ((procedure procedure) arg))))
   (lambda (procedure)
     ((lambda (func-arg)
        (lambda (n)
          (if (eqv? n 0)
              1
              (* n (func-arg (- n 1))))))
      (lambda (arg) ((procedure procedure) arg))))))

(define Y
  (lambda (f)
    ((lambda (x)
       (f (lambda (arg) ((x x) arg))))
     (lambda (x)
       (f (lambda (arg) ((x x) arg)))))))

(define f*
  (lambda (func-arg)
    (lambda (n)
      (if (eqv? n 0)
          1
          (* n (func-arg (- n 1)))))))

(define rember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [(eq? a (car lat)) (cdr lat)]
      [else (cons (car lat) (rember a (cdr lat)))])))

(define s '(apple blueberry strawberry pear))

(define g
  (lambda (func-arg)
    (lambda (a lat)
      (cond
        [(null? lat) '()]
        [(eq? a (car lat)) (cdr lat)]
        [else (cons (car lat) (func-arg a (cdr lat)))]))))

(define Y-rember
  (lambda (f)
    ((lambda (x)
       (f (lambda (arg1 arg2) ((x x) arg1 arg2))))
     (lambda (x)
       (f (lambda (arg1 arg2) ((x x) arg1 arg2)))))))

((Y-rember g) 'apple s)
((Y-rember g) 'peach s)