#lang racket

;; Turn the hof representations into ds reps
;; make sure to ^ the first set of formal 
;; parameters to the constructor 
;; build the match clauses
;; get rid of (else (k v))

(define empty-k
  (λ ()
    `(empty-k)))

(define outer-k
  (λ (n^ k^)
    `(outer-k ,n^ ,k^)))

(define inner-k
  (λ (v^ k^)
    `(inner-k ,v^ ,k^)))

(define apply-k
  (λ (k v)
    (match k 
      (`(empty-k) v)
      (`(outer-k ,n^ ,k^)
       (fib-cps (- n^ 2) (inner-k v k^)))
      (`(inner-k ,v^ ,k^) 
       (apply-k k^ (+ v^ v))))))

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) (apply-k k 0))
      ((zero? (- n 1)) (apply-k k 1))
      (else
       (fib-cps (- n 1)
         (outer-k n k))))))

(fib-cps 5 (empty-k))
