(set-logic ALL)
(set-option :produce-models true)
(declare-const income Int)
(declare-const percentage Int)
(declare-const tax Int)
(declare-const payout Int)

(assert (or 
  (
    and (< income 1000) (= percentage 10)
  )   
  (or 
    (and (< income 2000) (= percentage 25)) 
    (and (>= income 2000) (= percentage (/ income 10)))
  )
))

(assert( and 
          (= tax (/ income percentage)) 
          (= payout (- income tax))
       )
)
(assert (not (< payout income)))
(check-sat)
(get-model)

; Die Assertions können möglicherweise verletzt werden. Zum Beispiel durch das Modell :
;sat
;(model 
;  (define-fun percentage () Int 10)
;  (define-fun income () Int 0)
;  (define-fun tax () Int 0)
;  (define-fun payout () Int 0)
;  (define-fun /0 ((x!0 Real) (x!1 Real)) Real 0.0)
;)
