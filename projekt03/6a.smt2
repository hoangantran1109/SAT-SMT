(set-logic ALL)
(set-option :produce-models true)
(declare-const a0 Int)
(declare-const b0 Int)
(declare-const c Int)
(declare-const a1 Int)
(declare-const b1 Int)

(assert (and 
    (= c (+ a0 b0)) 
    (and (= b1 (- c b0)) 
         (= a1 (- c b1))
    ) 
  ) 
)
(assert (not (and (= a1 b0) (= b1 a0))))
(check-sat)
(get-model)

; Die Assertions können nicht verletzt werden.

