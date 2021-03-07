(set-logic ALL)
(set-option :produce-models true)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (=> (and 
              (and (=> A B) A ) 
              (or (not B) C) ) 
            (not C) ))
            
(check-sat)
(get-model)