#lang racket

(define apply-k
  (λ (k v)
    (k v)))

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) (apply-k k 0))
      ((zero? (- n 1)) (apply-k k 1))
      (else
       (fib-cps (- n 1)
         (λ (v)
            (fib-cps (- n 2)
              (λ (w) 
                (apply-k k (+ v w))))))))))

(fib-cps 5 (λ (v) v))
