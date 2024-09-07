#lang racket
(require "parentheC.rkt")

;; turn the constructors into a union
;; turn the match into a union-case
;; get rids of quasiquote and comma from both
;; add <union-name>_ to the front of each constructor use

(define-union kont
  (empty-k)
  (outer-k n^ k^)
  (inner-k v^ k^))

(define apply-k
  (λ (k v)
    (union-case k kont 
      ((empty-k) v)
      ((outer-k n^ k^)
       (fib-cps (- n^ 2) (kont_inner-k v k^)))
      ((inner-k v^ k^) 
       (apply-k k^ (+ v^ v))))))

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) (apply-k k 0))
      ((zero? (- n 1)) (apply-k k 1))
      (else
       (fib-cps (- n 1)
         (kont_outer-k n k))))))

(fib-cps 5 (kont_empty-k))
