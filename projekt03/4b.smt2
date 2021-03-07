; Till und Gill sind Geschwistern und genau einer der Häuptling ist.
; Till sagt: Gill ist Häuptling und Schurke !
; Gill sagt: Till ist nicht Häuptling, aber Ritter.


; Lösung: Es gibt nur eine mögliche Belegung:
; Till und Gill sind beide Schurke und Till ist die Häuptling


(set-logic ALL)
(set-option :produce-models true)
(declare-const Till Bool)
(declare-const Gill Bool)
(declare-const Till_Haeuptling Bool)
(declare-const Gill_Haeuptling Bool)

(assert (and  (= Till
(and  (not Gill)  Gill_Haeuptling))
              (not (= Gill_Haeuptling Till_Haeuptling))))

(assert (and  (= Gill 
(and  Till        (not Till_Haeuptling)))
              (not (= Gill_Haeuptling Till_Haeuptling))))

(check-sat)
(get-model)