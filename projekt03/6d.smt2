(set-logic ALL)
(set-option :produce-models true)
(declare-const arr (Array Int Int))
(declare-const i Int)
(declare-const n Int)

(assert (forall ((k Int)) 
        (=>
            (and (<= 0 k) (< k n ) ) 
            (= (select arr k) (select arr (- n (- k 1))))
        )
        )
)         
(assert (= n 5))
(assert (and (<= 0 i) (< i n ))) 
(assert (or (not(= (select arr 0) (select arr 4)))
            (not(= (select arr 1) (select arr 3)))
        )
)
(check-sat)
(get-model)

; Die Assertions können möglicherweise verletzt werden. Zum Beispiel durch das Modell :
;sat
;(model 
;  (define-fun i () Int
;    0)
;  (define-fun arr () (Array Int Int)
;    (lambda ((x!1 Int))
;  (let ((a!1 (ite (and (<= 1 x!1) (<= 2 x!1) (<= 3 x!1) (not (<= 4 x!1)))
;                  8097
;                  (ite (<= 1 x!1) 11 6467))))
; (let ((a!2 (ite (and (<= 1 x!1)
;                       (<= 2 x!1)
;                       (<= 3 x!1)
;                       (<= 4 x!1)
;                       (<= 5 x!1)
;                       (not (<= 6 x!1)))
;                  8098
;                  a!1)))
;  (let ((a!3 (ite (and (<= 1 x!1) (<= 2 x!1) (not (<= 3 x!1))) 5858 a!2)))
;  (let ((a!4 (ite (and (<= 1 x!1)
;                       (<= 2 x!1)
;                       (<= 3 x!1)
;                       (<= 4 x!1)
;                       (not (<= 5 x!1)))
;                  5858
;                  (ite (and (<= 1 x!1)
;                            (<= 2 x!1)
;                            (<= 3 x!1)
;                            (<= 4 x!1)
;                            (<= 5 x!1)
;                            (<= 6 x!1))
;                       6467
;                       a!3))))
;    (ite (and (<= 1 x!1) (not (<= 2 x!1))) 8098 a!4)))))))
;  (define-fun n () Int
;    5)
;)