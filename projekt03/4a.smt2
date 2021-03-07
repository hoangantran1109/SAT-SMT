;Während eines Besuches auf der Insel treffen Sie auf Alex und Chris.

;Alex sagt: Wir sind beide Schurken.


;Alex' Aussage ist äquivalent zu:

;„Alex ist ein Schurken und Chris ist ein Schurken .“

;Wäre Alex ein Ritter, so sagte er nicht, ein Schurken zu sein, weil er dabei löge. Also ist die Behauptung „Alex ist ein Schurken“ wahr.

;Da Schurken lügen und eine Aussage wahr ist, muss die andere Aussage falsch sein. Also ist die Behauptung „Chris ist ein Schurken“ notwendig falsch, 
;dann muss Chris ein Ritter sein.

;Lösung: Alex ist ein Schurken und Chris ist ein Ritter. 

;Alex <=> ( Alex and not Chris)

(set-logic ALL)
(set-option :produce-models true)
(declare-const Alex Bool)
(declare-const Chris Bool)
(assert (= Alex
(and   (not Alex)   (not Chris))))
(check-sat)
(get-model)