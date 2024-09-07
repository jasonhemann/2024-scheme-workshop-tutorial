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
       (let* ((k (kont_inner-k v k^))
              (n (- n^ 2))) 
         (fib-cps n k)))
      ((inner-k v^ k^) 
       (let* ((k k^)
              (v (+ v^ v)))
         (apply-k k v))))))

(define fib-cps
  (λ (n k)
    (cond
      ((zero? n) 
       (let* ((v 0))
         (apply-k k v)))
      ((zero? (- n 1))
       (let* ((v 1))
         (apply-k k v)))
      (else
       (let* ((k (kont_outer-k n k))
              (n (- n 1))) 
         (fib-cps n k))))))

(define main
  (λ ()
    (let* ((k (kont_empty-k))
           (n 5))
      (fib-cps n k))))
