#lang racket
(require "parentheC.rkt")

(define-registers k v n)

(define-union kont
  (empty-k)
  (outer-k n^ k^)
  (inner-k v^ k^))

(define apply-k
  (λ () ;; k v
    (union-case k kont 
      ((empty-k) v)
      ((outer-k n^ k^)
       (begin (set! k (kont_inner-k v k^))
              (set! n (- n^ 2))               
              (fib-cps)))
      ((inner-k v^ k^) 
       (begin (set! k k^)
              (set! v (+ v^ v))              
              (apply-k))))))

(define fib-cps
  (λ () ;; n k
    (cond
      ((zero? n) 
       (begin (set! v 0)              
              (apply-k)))
      ((zero? (- n 1))
       (begin (set! v 1)              
              (apply-k)))
      (else
       (begin (set! k (kont_outer-k n k))
              (set! n (- n 1))               
              (fib-cps))))))

(define main
  (λ ()
    (begin (set! k (kont_empty-k))
           (set! n 5)           
           (fib-cps))))
