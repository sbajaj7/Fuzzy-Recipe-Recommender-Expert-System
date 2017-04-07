
(clear)
(reset)
(import nrc.fuzzy.*)
(import nrc.fuzzy.jess.*)

; These are the global fuzzy variables

(defglobal ?*meal* = (new nrc.fuzzy.FuzzyVariable "meal" 0.0 10.0 "Type of Meal"))
(defglobal ?*proteins* = (new nrc.fuzzy.FuzzyVariable "proteins" 0.0 300 "Grams per Day"))
(defglobal ?*carbs* = (new nrc.fuzzy.FuzzyVariable "carbs" 0.0 600 "Grams per Day"))
(defglobal ?*fats* = (new nrc.fuzzy.FuzzyVariable "fats" 0.0 200 "Grams per Day"))

(defglobal ?*proteinstartersugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion1" 1.0 5.0 ""))
(defglobal ?*proteinmaincoursesugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion2" 1.0 5.0 ""))
(defglobal ?*proteindesertsugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion3" 1.0 5.0 ""))

(defglobal ?*carbstartersugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion4" 1.0 5.0 ""))
(defglobal ?*carbmaincoursesugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion5" 1.0 5.0 ""))
(defglobal ?*carbdesertsugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion6" 1.0 5.0 ""))

(defglobal ?*fatstartersugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion7" 1.0 5.0 ""))
(defglobal ?*fatmaincoursesugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion8" 1.0 5.0 ""))
(defglobal ?*fatdesertsugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion9" 1.0 5.0 ""))

(defglobal ?*lowstartersugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion10" 1.0 5.0 ""))
(defglobal ?*highstartersugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion11" 1.0 5.0 ""))

(defglobal ?*lowmaincoursesugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion12" 1.0 5.0 ""))
(defglobal ?*highmaincoursesugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion13" 1.0 5.0 ""))

(defglobal ?*lowdesertsugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion14" 1.0 5.0 ""))
(defglobal ?*highdesertsugestion* = (new nrc.fuzzy.FuzzyVariable "suggestion15" 1.0 5.0 ""))


; This is the initial rule that initializes the different possibilities of each
; fuzzy variable

(defrule initFuzzy
    =>
    (load-package nrc.fuzzy.jess.FuzzyFunctions) 
    (?*meal* addTerm "starter" (create$ 0.0 3.0) (create$ 1.0 0.0) 2)
    (?*meal* addTerm "maincourse" (create$ 3.0 5.0 7.0) (create$ 0.0 1.0 0.0) 3)
    (?*meal* addTerm "desert" (create$ 7.0 10.0) (create$ 0.0 1.0) 2)
    (?*proteins* addTerm "low" (create$ 0.0 100.0) (create$ 1.0 0.0) 2)
    (?*proteins* addTerm "high" (create$ 100.0 300.0) (create$ 0.0 1.0) 2)
    (?*carbs* addTerm "less" (create$ 0.0 300) (create$ 1.0 0.0) 2)
    (?*carbs* addTerm "more" (create$ 300 600) (create$ 0.0 1.0) 2)
    (?*fats* addTerm "less" (create$ 0.0 80) (create$ 1.0 0.0) 2)
    (?*fats* addTerm "more" (create$ 80 200) (create$ 0.0 1.0) 2)
    
    (?*carbstartersugestion* addTerm "lowcarb" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*carbstartersugestion* addTerm "highcarb" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*carbmaincoursesugestion* addTerm "lowcarb" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*carbmaincoursesugestion* addTerm "highcarb" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*carbdesertsugestion* addTerm "lowcarb" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*carbdesertsugestion* addTerm "highcarb" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*proteinstartersugestion* addTerm "lowprotein" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*proteinstartersugestion* addTerm "highprotein" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*proteinmaincoursesugestion* addTerm "lowprotein" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*proteinmaincoursesugestion* addTerm "highprotein" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*proteindesertsugestion* addTerm "lowprotein" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*proteindesertsugestion* addTerm "highprotein" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*fatstartersugestion* addTerm "lowfat" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*fatstartersugestion* addTerm "highfat" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*fatmaincoursesugestion* addTerm "lowfat" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*fatmaincoursesugestion* addTerm "highfat" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (?*fatdesertsugestion* addTerm "lowfat" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*fatdesertsugestion* addTerm "highfat" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*lowstartersugestion* addTerm "lowall" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*highstartersugestion* addTerm "highall" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*lowmaincoursesugestion* addTerm "lowall" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*highmaincoursesugestion* addTerm "highall" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    
    (?*lowdesertsugestion* addTerm "lowall" (create$ 1 2.5) (create$ 1.0 0.0) 2)
    (?*highdesertsugestion* addTerm "highall" (create$ 2.5 5) (create$ 0.0 1.0) 2)
    (assert (initDone))
    )

; Once the fuzzy variables are initialized, the user is prompted for input using this rule
; Then based on user input, this rule creates necessary facts for recommendation

(defrule acceptVal
    (initDone)
    =>
    (printout t "Please enter your name and then press enter key> ")
    (bind ?name (readline))
    (printout t crlf " " crlf)
    (printout t " Hello, " ?name "." crlf)
    (printout t " Welcome to the Fuzzy Recipe Recommender Expert System" crlf)
    (printout t " Please answer the following questions and we will tell you what meal to cook." crlf)
    (printout t " " crlf crlf)
	(printout t "What would you like to have?(Use one of these: starter or maincourse or desert)" crlf)
	(bind ?ml (readline))
    (printout t "Do you want to have a high protein meal or a low protein meal(Use one of these: low/high)" crlf)
    (bind ?pt (readline))
    (printout t "Do you want to have a less Carbohydrates or more Carbohydrates in your diet (Use one of these: less/more)" crlf)
    (bind ?cb (readline))
    (printout t "How much fats do you want to consume in your meal (Use one of these: less/more)" crlf)
    (bind ?ft (readline))
	(assert (meal (new nrc.fuzzy.FuzzyValue ?*meal* ?ml)))
    (assert (proteins (new nrc.fuzzy.FuzzyValue ?*proteins* ?pt)))
    (assert (carbs (new nrc.fuzzy.FuzzyValue ?*carbs* ?cb)))
    (assert (fats (new nrc.fuzzy.FuzzyValue ?*fats* ?ft))))

; Each rule tackles one particular combination of proteins, Carbohydrates, fats and type of meal.
; Proteins has 2 possibilities, carbohydrates has 2 possibilities, fats has 2 possibilities and type of meal has 3 possibilities.
; This gives to a total of 24 rules to cover all combinations of the above three
; The following 24 rules are for the same.

; Rule 1
(defrule S_L_L_L
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion10 (new nrc.fuzzy.FuzzyValue ?*lowstartersugestion* "lowall")))
    )

; Rule 2
(defrule S_H_L_L
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion1 (new nrc.fuzzy.FuzzyValue ?*proteinstartersugestion* "highprotein")))
    )

; Rule 3
(defrule S_L_H_L
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion4 (new nrc.fuzzy.FuzzyValue ?*carbstartersugestion* "highcarb")))
    )

; Rule 4
(defrule S_L_L_H
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion7 (new nrc.fuzzy.FuzzyValue ?*fatstartersugestion* "highfat")))
    )

; Rule 5
(defrule S_H_H_L
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion7 (new nrc.fuzzy.FuzzyValue ?*fatstartersugestion* "lowfat")))
    )

; Rule 6
(defrule S_H_L_H
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion4 (new nrc.fuzzy.FuzzyValue ?*carbstartersugestion* "lowcarb")))
    )

; Rule 7
(defrule S_L_H_H
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion1 (new nrc.fuzzy.FuzzyValue ?*proteinstartersugestion* "lowprotein")))
    )

; Rule 8
(defrule S_H_H_H
    (meal ?f&:(fuzzy-match ?f "starter"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion11 (new nrc.fuzzy.FuzzyValue ?*highstartersugestion* "highall")))
    )

; Rules for maincourse
; Rule 9
(defrule M_L_L_L
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion12 (new nrc.fuzzy.FuzzyValue ?*lowmaincoursesugestion* "lowall")))
    )

; Rule 10
(defrule M_H_L_L
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion2 (new nrc.fuzzy.FuzzyValue ?*proteinmaincoursesugestion* "highprotein")))
    )

; Rule 11
(defrule M_L_H_L
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion5 (new nrc.fuzzy.FuzzyValue ?*carbmaincoursesugestion* "highcarb")))
    )

; Rule 12
(defrule M_L_L_H
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion8 (new nrc.fuzzy.FuzzyValue ?*fatmaincoursesugestion* "highfat")))
    )

; Rule 13
(defrule M_H_H_L
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion8 (new nrc.fuzzy.FuzzyValue ?*fatmaincoursesugestion* "lowfat")))
    )

; Rule 14
(defrule M_H_L_H
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion5 (new nrc.fuzzy.FuzzyValue ?*carbmaincoursesugestion* "lowcarb")))
    )

; Rule 15
(defrule M_L_H_H
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion2 (new nrc.fuzzy.FuzzyValue ?*proteinmaincoursesugestion* "lowprotein")))
    )

; Rule 16
(defrule M_H_H_H
    (meal ?f&:(fuzzy-match ?f "maincourse"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion13 (new nrc.fuzzy.FuzzyValue ?*highmaincoursesugestion* "highall")))
    )

; Rules for desert
; Rule 17
(defrule D_L_L_L
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion14 (new nrc.fuzzy.FuzzyValue ?*lowdesertsugestion* "lowall")))
    )

; Rule 18
(defrule D_H_L_L
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion3 (new nrc.fuzzy.FuzzyValue ?*proteindesertsugestion* "highprotein")))
    )

; Rule 19
(defrule D_L_H_L
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion6 (new nrc.fuzzy.FuzzyValue ?*carbdesertsugestion* "highcarb")))
    )

; Rule 20
(defrule D_L_L_H
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion9 (new nrc.fuzzy.FuzzyValue ?*fatdesertsugestion* "highfat")))
    )

; Rule 21
(defrule D_H_H_L
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "less"))
    =>
    (assert (suggestion9 (new nrc.fuzzy.FuzzyValue ?*fatdesertsugestion* "lowfat")))
    )

; Rule 22
(defrule D_H_L_H
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "less"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion6 (new nrc.fuzzy.FuzzyValue ?*carbdesertsugestion* "lowcarb")))
    )

; Rule 23
(defrule D_L_H_H
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "low"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion3 (new nrc.fuzzy.FuzzyValue ?*proteindesertsugestion* "lowprotein")))
    )

; Rule 24
(defrule D_H_H_H
    (meal ?f&:(fuzzy-match ?f "desert"))
    (proteins ?c&:(fuzzy-match ?c "high"))
    (carbs ?a&:(fuzzy-match ?a "more"))
    (fats ?b&:(fuzzy-match ?b "more"))
    =>
    (assert (suggestion15 (new nrc.fuzzy.FuzzyValue ?*highdesertsugestion* "highall")))
    )

;Matching Rules for starter

(defrule Recom1
    (suggestion10 ?i&:(fuzzy-match ?i "lowall"))
    =>
    (printout t "You can cook Tropical Pico De Gallo(starter), which has low protein, less carbs and less fats" crlf "For method of preparation & ingredients follow: http://www.hungry-girl.com/recipes/tropical-pico-de-gallo." crlf))

(defrule Recom2
    (suggestion1 ?i&:(fuzzy-match ?i "highprotein"))
    =>
    (printout t "You can cook a protein bar(starter), which has high protein, less carbs and less fats" crlf "For method of preparation & ingredients follow: http://www.foodnetwork.co.uk/recipes/protein-bars.html." crlf))

(defrule Recom3
    (suggestion4 ?j&:(fuzzy-match ?j "highcarb"))
    =>
    (printout t "You can cook starchy vegetables(starter), which has low protein, high carbs and less fats" crlf "For method of preparation & ingredients follow: http://www.livestrong.com/article/438316-high-carb-low-protein-and-low-fat-foods/" crlf))

(defrule Recom4
    (suggestion7 ?k&:(fuzzy-match ?k "highfat"))
    =>
    (printout t "You can cook Roasted Spaghetti Squash with Basil and Parmesan(starter), which has low protein, less carbs and more fats" crlf "http://lowcarbhighfatrecipes.com/roasted-spaghetti-squash-with-basil-and-parmesan/" crlf))

(defrule Recom5
    (suggestion7 ?ll&:(fuzzy-match ?ll "lowfat"))
    =>
    (printout t "You can cook sweet potato(starter), which has high protein, more carbs and less fats" crlf "For method of preparation & ingredients follow: http://www.muscleandfitness.com/nutrition/gain-mass/7-protein-packed-and-carb-rich-foods" crlf))

(defrule Recom6
    (suggestion4 ?ll&:(fuzzy-match ?ll "lowcarb"))
    =>
    (printout t "You can cook yoghurt with cucumbers(starter), which has high protein, less carbs and more fats" crlf "For method of preparation & ingredients follow: http://www.webmd.com/diet/ss/slideshow-low-carb-snacks" crlf))

(defrule Recom7
    (suggestion1 ?ll&:(fuzzy-match ?ll "lowprotein"))
    =>
    (printout t "You can cook chilly cheese potato(starter), which has low protein, more carbs and more fats" crlf "For method of preparation & ingredients follow: http://neighborfoodblog.com/2014/02/twice-baked-chili-cheese-potatoes-sundaysupper.html" crlf))

(defrule Recom8
    (suggestion11 ?i&:(fuzzy-match ?i "highall"))
    =>
    (printout t "You can cook a cheese burger(starter), which has high proteins, more carbohydrates and proteins." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=cp0pJDL5zhE" crlf))


; Matching Rules for Maincourse

(defrule Recom9
    (suggestion12 ?i&:(fuzzy-match ?i "lowall"))
    =>
    (printout t "You can cook Broccoli curry(maincourse), which has low protein, less carbs and less fats" crlf "For method of preparation & ingredients follow: http://indianhealthyrecipes.com/broccoili-gravy-for-chapathi-roti-paratha/" crlf))

(defrule Recom10
    (suggestion2 ?i&:(fuzzy-match ?i "highprotein"))
    =>
    (printout t "You can cook Cashew Noodles With Broccoli and Tofu(maincourse), which has high proteins." crlf "For method of preparation & ingredients follow: http://www.wholefoodsmarket.com/recipe/cashew-noodles-broccoli-and-tofu" crlf))

(defrule Recom11
    (suggestion5 ?j&:(fuzzy-match ?j "highcarb"))
    =>
    (printout t "You can cook Amaranth grains(maincourse), which has high carbs" crlf "For method of preparation & ingredients follow: http://www.drweil.com/diet-nutrition/cooking-cookware/cooking-with-grains-amaranth/" crlf))

(defrule Recom12
    (suggestion8 ?k&:(fuzzy-match ?k "highfat"))
    =>
    (printout t "You can cook cheese baked mushrooms(maincourse), which has high fats." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=C7LKD3SgJ5U" crlf))

(defrule Recom13
    (suggestion8 ?ll&:(fuzzy-match ?ll "lowfat"))
    =>
    (printout t "You can cook potato onion curry(maincourse), which has high protein, more carbs and less fats" crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=X9ANIPIeejs" crlf))

(defrule Recom14
    (suggestion5 ?ll&:(fuzzy-match ?ll "lowcarb"))
    =>
    (printout t "You can cook Paneer (Cottage Cheese) curry(maincourse), which has high protein, less carbs and more fats" crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=rSygSz7aj9w" crlf))

(defrule Recom15
    (suggestion2 ?ll&:(fuzzy-match ?ll "lowprotein"))
    =>
    (printout t "You can cook Cheese Hamburer(maincourse), which has low protein, high carbs and high fats." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=7jiRR2hENGE" crlf))

(defrule Recom16
    (suggestion13 ?i&:(fuzzy-match ?i "highall"))
    =>
    (printout t "You can cook sea weed wrap(maincourse), which has all ingredients in high quantities." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=4eSDiuz4tIs" crlf))


; Matching Rules for desert

(defrule Recom17
    (suggestion14 ?i&:(fuzzy-match ?i "lowall"))
    =>
    (printout t "You can cook Tropical Avacado Ice Cream(desert), which has low proteins, less carbohydrates & less fats." crlf "For method of preparation & ingredients follow: http://www.delish.com/cooking/recipe-ideas/recipes/a48798/tropical-avocado-ice-cream-recipe/" crlf))

(defrule Recom18
    (suggestion3 ?i&:(fuzzy-match ?i "highprotein"))
    =>
    (printout t "You can cook guilt free cake bars(desert), which has high proteins." crlf "For method of preparation & ingredients follow: http://www.feedingmyaddiction.com/2014/08/guilt-free-birthday-cake-bars.html" crlf))

(defrule Recom19
    (suggestion6 ?j&:(fuzzy-match ?j "highcarb"))
    =>
    (printout t "You can cook Apple Pie(desert), which has more carbs." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=xkiYn8LFFQY" crlf))

(defrule Recom20
    (suggestion9 ?k&:(fuzzy-match ?k "highfat"))
    =>
    (printout t "You can cook Nutella Brownies(desert), which has more fats." crlf "For method of preparation & ingredients follow: http://www.yummly.com/recipe/Nutella-Brownies-1878213" crlf))

(defrule Recom21
    (suggestion9 ?ll&:(fuzzy-match ?ll "lowfat"))
    =>
    (printout t "You can cook fat free chocolate pudding with brownies(desert), which has high protein, more carbs and less fat." crlf "Make a desert shttp://www.food.com/recipe/no-fat-chocolate-pudding-265994" crlf))

(defrule Recom22
    (suggestion6 ?ll&:(fuzzy-match ?ll "lowcarb"))
    =>
    (printout t "You can cook protein pie(desert), which has high protein, less carbs and more fats." crlf "For method of preparation & ingredients follow: https://recipes.sparkpeople.com/recipe-detail.asp?recipe=855546" crlf))

(defrule Recom23
    (suggestion3 ?ll&:(fuzzy-match ?ll "lowprotein"))
    =>
    (printout t "You can cook Marshmallows desert with chocolate syrup(desert), which has low protein, more carbs and more fats." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=mnuHyD5IpQ4" crlf))

(defrule Recom24
    (suggestion15 ?i&:(fuzzy-match ?i "highall"))
    =>
    (printout t "You can cook New York Cheesecake with Caramel Fudge Sauce(desert), which has high protein, more carbs and more fats." crlf "For method of preparation & ingredients follow: https://www.youtube.com/watch?v=SARReq5smA0" crlf))


(run)
