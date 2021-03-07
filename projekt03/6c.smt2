(set-logic ALL)
(set-option :produce-models true)
(declare-const arr (Array Int Int))
(declare-const a Int)
(declare-const i Int)
(declare-const n Int)


(assert (forall ((k Int)) 
        (=>
            (and (< 0 k) (< k n ) ) 
            (= (select arr k ) 0))
        )
)

(assert (and (<= 0 i) (< i n ))) 
(assert (= (select arr i) a )  ) 
(assert (not(not(= a 42))))
(check-sat)
(get-model)

; Die Assertions können möglicherweise verletzt werden. Zum Beispiel durch das Modell :
;sat
;(model 
;  (define-fun i () Int
;    0)
;  (define-fun n () Int
;    1)
;  (define-fun arr () (Array Int Int)
;    (lambda ((x!1 Int)) (ite (<= 1 x!1) 3 42)))
;  (define-fun a () Int
;    42)
;)
;)