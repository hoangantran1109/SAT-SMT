(set-logic ALL)
(set-option :produce-models true)

(declare-const A Bool)

(assert (= (or A (not A)) true))
            
(check-sat)
(get-model)