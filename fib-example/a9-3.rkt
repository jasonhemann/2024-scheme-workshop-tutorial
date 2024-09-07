#lang racket

(define apply-k
  (λ (k v)
    (k v)))

(define empty-k
  (λ ()
    (λ (v)
      v)))

(define outer-k
  (λ (n k)
    (λ (v)
      (fib-cps (- n 2)
        (inner-k v k)))))

(define inner-k
  (λ (v k)
    (λ (w) 
      (apply-k k (+ v w)))))

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) (apply-k k 0))
      ((zero? (- n 1)) (apply-k k 1))
      (else
       (fib-cps (- n 1)
         (outer-k n k))))))

(fib-cps 5 (empty-k))
