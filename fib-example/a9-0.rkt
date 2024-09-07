#lang racket

(define fib
  (λ (n)
    (cond
      ((zero? n) 0)
      ((zero? (- n 1)) 1)
      (else (+ (fib (- n 1))
               (fib (- n 2)))))))

(fib 5)
