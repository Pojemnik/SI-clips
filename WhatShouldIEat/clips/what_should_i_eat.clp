(deftemplate ui-template
	(slot question (type STRING))
	(multislot answers (type STRING))
	(multislot image (type STRING))
)

(deffacts startup
   (start)
)

(defrule rule1
	(start)
	=>
	(assert (ui-template (question "Are you in Japan?") (image "") (answers "Yes" "No")))
)