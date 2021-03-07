(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)

(assert
  (not (= (and (not A) (not B))
          (not (or A B)))))
(check-sat)