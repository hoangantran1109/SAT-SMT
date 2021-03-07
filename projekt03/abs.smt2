(set-logic ALL)
(set-option :produce-models true)

(declare-const x Int)
(declare-const y Int)

(assert (or (and (<  x 0) (= y (- x)))
            (and (>= x 0) (= y    x))))
(assert (not(>= y 0)))

(check-sat)
(get-model)