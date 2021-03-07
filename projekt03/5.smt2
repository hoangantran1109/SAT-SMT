(set-logic ALL)
(set-option :produce-models true)

(define-fun sorted ((a (Array Int Int)) (n Int)) Bool
    (forall ((k Int)) 
        (=>
            ( and (<= 0 k) ( < k (- n 1) ))
            (<= (select a k) (select a (+ k 1) ))
        )
    )
)


; SOME TESTCASES

(push)
; an array with no elements is sorted
(declare-const a (Array Int Int))
(assert (sorted a 0))
(set-info :status sat)
(check-sat)
(pop)

(push)
; an array with one element is sorted
(declare-const a (Array Int Int))
(assert (sorted a 1))
(set-info :status sat)
(check-sat)
(pop)

(push)
; an array with three increasing elements is sorted
(declare-const a (Array Int Int))
(assert (= (select a 0)  0))
(assert (= (select a 1)  1))
(assert (= (select a 2)  2))
(assert (sorted a 3))
(set-info :status sat)
(check-sat)
(pop)

(push)
; an array with three decreasing elements is not sorted
(declare-const a (Array Int Int))
(assert (= (select a 0)  2))
(assert (= (select a 1)  1))
(assert (= (select a 2)  0))
(assert (sorted a 3))
(set-info :status unsat)
(check-sat)
(pop)

(push)
; an array of three unknown elements may be sorted
(declare-const a (Array Int Int))
(assert (sorted a 3))
(set-info :status sat)
(check-sat)
(pop)

(push)
; an array of three unknown elements is may not be sorted
(declare-const a (Array Int Int))
(assert (not (sorted a 3)))
(set-info :status sat)
(check-sat)
(pop)

(push)
; elements outside bounds don't matter
(declare-const a (Array Int Int))
(assert (= (select a -1)  23))
(assert (= (select a  0)   2))
(assert (= (select a  1)   3))
(assert (= (select a  2)   5))
(assert (= (select a  3)   7))
(assert (= (select a  4)  11))
(assert (= (select a  5)   0))
(assert (sorted a 5))
(set-info :status sat)
(check-sat)
(pop)

(push)
; lower bound is tight
(declare-const a (Array Int Int))
(assert (= (select a  0)  23))
(assert (= (select a  1)   0))
(assert (= (select a  2)   1))
(assert (= (select a  3)   2))
(assert (sorted a 4))
(set-info :status unsat)
(check-sat)
(pop)

(push)
; upper bound is tight
(declare-const a (Array Int Int))
(assert (= (select a  0)  -1))
(assert (= (select a  1)   0))
(assert (= (select a  2)   1))
(assert (= (select a  3)   0))
(assert (sorted a 4))
(set-info :status unsat)
(check-sat)
(pop)

(push)
; symbolic check to compare successive elements
(declare-const a (Array Int Int))
(declare-const k Int)
(declare-const n Int)
(assert (sorted a n)) ; array sorted
(assert (<= 0 k))     ; k in bounds
(assert (< (+ k 1) n))

; no k should have this property, therefore we expect an unsat result
(assert (> (select a k) (select a (+ k 1))))
(set-info :status unsat)
(check-sat)
(pop)