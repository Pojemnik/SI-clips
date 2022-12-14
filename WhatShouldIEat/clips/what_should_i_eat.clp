(deftemplate ui-template
	(slot question (type STRING))
	(multislot answers (type STRING))
	(multislot image (type STRING))
)

(deffacts startup
   (start)
)

(defrule remove-old-ui
	?f1 <- (clean)
	?f2 <- (ui-template)
	=>
	(retract ?f1)
	(retract ?f2)
)

(defrule japan
	(start)
	=>
	(assert (ui-template (question "Japan") (image) (answers "Yes" "No")))
)

(defrule japanEnd
	(start)
	(JapanYes)
	=>
	(assert (ui-template (question "") (image "Japan_(Y)_1") (answers)))
)

(defrule unemployment
	(start)
	(JapanNo)
	=>
	(assert (ui-template (question "unemployment") (image) (answers "Yes" "No")))
)

(defrule unemploymentEnd
	(start)
	(JapanNo)
	(unemploymentYes)
	=>
	(assert (ui-template (question "") (image "unemployment_(Y)_1" "unemployment_(Y)_2" "unemployment_(Y)_3") (answers)))
)

(defrule alaska
	(start)
	(JapanNo)
	(unemploymentNo)
	=>
	(assert (ui-template (question "Alaska") (image) (answers "Yes" "No")))
)

(defrule alaskaEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaYes)
	=>
	(assert (ui-template (question "") (image "Alaska_(Y)_1") (answers)))
)

(defrule diet
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	=>
	(assert (ui-template (question "diet") (image) (answers "Yes" "No")))
)

(defrule dietEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietYes)
	=>
	(assert (ui-template (question "") (image "diet_(Y)_1" "diet_(Y)_2" "diet_(Y)_3" "diet_(Y)_4" "diet_(Y)_5") (answers)))
)

(defrule vegetarian
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	=>
	(assert (ui-template (question "vegetarian") (image) (answers "Yes" "No")))
)

(defrule vegan
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianYes)
	=>
	(assert (ui-template (question "vegan") (image) (answers "Yes" "No")))
)

(defrule veganYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianYes)
	(veganYes)
	=>
	(assert (ui-template (question "") (image "vegan_Y_1" "vegan_Y_2") (answers)))
)

(defrule veganNoEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianYes)
	(veganNo)
	=>
	(assert (ui-template (question "") (image "vegan_N_1" "vegan_N_2") (answers)))
)

(defrule pizza
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	=>
	(assert (ui-template (question "pizza") (image) (answers "Yes" "No")))
)

(defrule parents
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaYes)
	=>
	(assert (ui-template (question "parents") (image) (answers "Yes" "No")))
)

(defrule parentsEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaYes)
	(parentsYes)
	=>
	(assert (ui-template (question "") (image "parents_(Y)_1" "parents_(Y)_2" "parents_(Y)_3" "parents_(Y)_4") (answers)))
)

(defrule impress
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaYes)
	(parentsNo)
	=>
	(assert (ui-template (question "impress") (image) (answers "Yes" "No")))
)

(defrule impressNoEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaYes)
	(parentsNo)
	(impressNo)
	=>
	(assert (ui-template (question "") (image "impress_(N)_1" "impress_(Y)_2" "impress_(Y)_3") (answers)))
)

(defrule impressYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaYes)
	(parentsNo)
	(impressYes)
	=>
	(assert (ui-template (question "") (image "impress_(N)_1" "impress_(N)_2") (answers)))
)

(defrule cleaning
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	=>
	(assert (ui-template (question "cleaning") (image) (answers "Yes" "No")))
)

(defrule cleaningEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningYes)
	=>
	(assert (ui-template (question "") (image "cleaning_(Y)_1" "cleaning_(Y)_2" "cleaning_(Y)_3") (answers)))
)

(defrule who
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	=>
	(assert (ui-template (question "Who") (image) (answers "Yes" "No")))
)

(defrule whoEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoYes)
	=>
	(assert (ui-template (question "") (image "Who_(Y)_1") (answers)))
)

(defrule thristy
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	=>
	(assert (ui-template (question "thirsty") (image) (answers "Yes" "No")))
)

(defrule thristyEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyYes)
	=>
	(assert (ui-template (question "") (image "thirsty_(Y)_1") (answers)))
)

(defrule breakfast
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	=>
	(assert (ui-template (question "breakfast") (image) (answers "Yes" "No")))
)

(defrule summer
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastYes)
	=>
	(assert (ui-template (question "2010") (image) (answers "Yes" "No")))
)

(defrule summerEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastYes)
	(2010No)
	=>
	(assert (ui-template (question "") (image "2010_(N)_1" "2010_(N)_2" "2010_(N)_3" "2010_(N)_4") (answers)))
)

(defrule benes
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastYes)
	(2010Yes)
	=>
	(assert (ui-template (question "Benes") (image) (answers "Yes" "No")))
)

(defrule benesYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastYes)
	(2010Yes)
	(BenesYes)
	=>
	(assert (ui-template (question "") (image "Benes_(Y)_1") (answers)))
)

(defrule benesNoEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastYes)
	(2010Yes)
	(BenesNo)
	=>
	(assert (ui-template (question "") (image "Benes_(N)_1" "Benes_(N)_2") (answers)))
)

(defrule jewish
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	=>
	(assert (ui-template (question "Jewish") (image) (answers "Yes" "No")))
)

(defrule jewishEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishYes)
	=>
	(assert (ui-template (question "") (image "Jewish_(Y)_1") (answers)))
)

(defrule wow
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	=>
	(assert (ui-template (question "WoW") (image) (answers "Yes" "No")))
)

(defrule wowEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWYes)
	=>
	(assert (ui-template (question "") (image "Wow_(Y)_1") (answers)))
)

(defrule foreman
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	=>
	(assert (ui-template (question "Foreman") (image) (answers "Yes" "No")))
)

(defrule foremanEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanYes)
	=>
	(assert (ui-template (question "") (image "Foreman_(Y)_1") (answers)))
)

(defrule dessert
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	=>
	(assert (ui-template (question "dessert") (image) (answers "Yes" "No")))
)

(defrule school
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	=>
	(assert (ui-template (question "school") (image) (answers "Yes" "No")))
)

(defrule schoolEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolYes)
	=>
	(assert (ui-template (question "") (image "school_(Y)_1" "school_(Y)_2" "school_(Y)_3") (answers)))
)

(defrule high
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	=>
	(assert (ui-template (question "drunk") (image) (answers "Yes" "No")))
)

(defrule highEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkYes)
	=>
	(assert (ui-template (question "") 
	(image 
	"drunk_(Y)_1"
	"drunk_(Y)_2"
	"drunk_(Y)_3"
	"drunk_(Y)_4"
	"drunk_(Y)_5"
	"drunk_(Y)_6"
	"drunk_(Y)_7"
	"drunk_(Y)_8"
	"drunk_(Y)_9"
	"drunk_(Y)_10"
	) (answers)))
)

(defrule ethnic
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	=>
	(assert (ui-template (question "food") (image) (answers "Yes" "No")))
)

(defrule ethnicEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodYes)
	=>
	(assert (ui-template (question "") 
	(image 
	"food_(Y)_1"
	"food_(Y)_2"
	"food_(Y)_3"
	"food_(Y)_4"
	) (answers)))
)

(defrule chain
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodNo)
	=>
	(assert (ui-template (question "restaurants") (image) (answers "Yes" "No")))
)

(defrule chainEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodNo)
	(restaurantsYes)
	=>
	(assert (ui-template (question "") 
	(image 
	"restaurants_(Y)_1"
	"restaurants_(Y)_2" 
	"restaurants_(Y)_3"
	"restaurants_(Y)_4"
	) (answers)))
)

(defrule oven
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodNo)
	(restaurantsNo)
	=>
	(assert (ui-template (question "oven") (image) (answers "Yes" "No")))
)

(defrule ovenYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodNo)
	(restaurantsNo)
	(ovenYes)
	=>
	(assert (ui-template (question "") 
	(image 
	"oven_(Y)_1"
	"oven_(Y)_2" 
	"oven_(Y)_3" 
	"oven_(Y)_4") (answers)))
)

(defrule ovenNoEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertNo)
	(schoolNo)
	(drunkNo)
	(foodNo)
	(restaurantsNo)
	(ovenNo)
	=>
	(assert (ui-template (question "") (image "oven_(N)_1") (answers)))
)

(defrule childhood
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	=>
	(assert (ui-template (question "childhood") (image) (answers "Yes" "No")))
)

(defrule childhoodEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodYes)
	=>
	(assert (ui-template (question "") 
	(image 
	"childhood_(Y)_1" 
	"childhood_(Y)_2" 
	"childhood_(Y)_3") (answers)))
)

(defrule pie
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	=>
	(assert (ui-template (question "Lavenstein") (image) (answers "Yes" "No")))
)

(defrule pieEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinYes)
	=>
	(assert (ui-template (question "") (image "Levenstein_(Y)_1" "Levenstein_(Y)_2" "Levenstein_(Y)_3" "Levenstein_(Y)_4") (answers)))
)

(defrule iceCream
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	=>
	(assert (ui-template (question "cream") (image) (answers "Yes" "No")))
)

(defrule iceCreamEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamNo)
	=>
	(assert (ui-template (question "") (image "cream_(N)_1" "cream_(N)_2" "cream_(N)_3" "cream_(N)_4") (answers)))
)

(defrule lactose
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamYes)
	=>
	(assert (ui-template (question "intolerant") (image) (answers "Yes" "No")))
)

(defrule lactoseEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamYes)
	(intolerantYes)
	=>
	(assert (ui-template (question "") (image "intolerant_(Y)_1") (answers)))
)

(defrule spoon
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamYes)
	(intolerantNo)
	=>
	(assert (ui-template (question "spoon") (image) (answers "Yes" "No")))
)

(defrule spoonYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamYes)
	(intolerantNo)
	(spoonYes)
	=>
	(assert (ui-template (question "") (image 
	"spoon_(Y)_1"
	"spoon_(Y)_2"
	"spoon_(Y)_3"
	"spoon_(Y)_4"
	"spoon_(Y)_5"
	"spoon_(Y)_6") (answers)))
)

(defrule spoonYesEnd
	(start)
	(JapanNo)
	(unemploymentNo)
	(AlaskaNo)
	(dietNo)
	(vegetarianNo)
	(pizzaNo)
	(cleaningNo)
	(WhoNo)
	(thirstyNo)
	(breakfastNo)
	(JewishNo)
	(WoWNo)
	(ForemanNo)
	(dessertYes)
	(childhoodNo)
	(LavensteinNo)
	(creamYes)
	(intolerantNo)
	(spoonNo)
	=>
	(assert (ui-template (question "") (image 
	"spoon_(N)_1"
	"spoon_(N)_2"
	"spoon_(N)_3"
	"spoon_(N)_4") (answers)))
)