(set-logic ALL)
(set-option :produce-models true)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (not (= (or A (and B C)) 
                (or (and A B) (and A C)))))
            
(check-sat)
(get-model)