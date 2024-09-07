;; #lang racket
;; (require "parentheC.rkt")

;; construct the program counter
;; turn (foo) into (set! pc foo)
;; get rid of the (set! k ...) in main
;; mount-trampoline
;; add jumpout to empty-k in the define-union
;; and in the union-case
;; dismount-trampoline with the jumpout

(define-program-counter pc)
(define-registers k v n)

(define-union kont
  (empty-k jumpout)
  (outer-k n^ k^)
  (inner-k v^ k^))

(define-label apply-k
  (union-case k kont 
    ((empty-k jumpout)
     (dismount-trampoline jumpout))
    ((outer-k n^ k^)
     (begin (set! k (kont_inner-k v k^))
            (set! n (- n^ 2))               
            (set! pc fib-cps)))
    ((inner-k v^ k^) 
     (begin (set! k k^)
            (set! v (+ v^ v))              
            (set! pc apply-k)))))

(define-label fib-cps
  (cond
    ((zero? n) 
     (begin (set! v 0)              
            (set! pc apply-k)))
    ((zero? (- n 1))
     (begin (set! v 1)              
            (set! pc apply-k)))
    (else
     (begin (set! k (kont_outer-k n k))
            (set! n (- n 1))               
            (set! pc fib-cps)))))

(define-label main
  (begin (set! n 5)           
         (set! pc fib-cps)
         (mount-trampoline kont_empty-k k pc)
         (printf "~s\n" v)))
