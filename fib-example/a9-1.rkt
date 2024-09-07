#lang racket

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) (k 0))
      ((zero? (- n 1)) (k 1))
      (else
       (fib-cps (- n 1)
         (λ (v)
            (fib-cps (- n 2)
              (λ (w) 
                (k (+ v w))))))))))

(fib-cps 5 (λ (v) v))
