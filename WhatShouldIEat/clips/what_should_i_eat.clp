(deftemplate hobbit
(slot imie (type STRING))
(slot wzrost (type NUMBER))
(slot waga (type NUMBER))
)

(deffacts startup
   (asdf))

(defrule rule1 (asdf) =>
(assert (hobbit (imie "Bilbo") (wzrost 110) (waga 40)))
)