---
title: "peter the baker"
tags: ""
---

Pete, the baker

Pete likes to bake cakes. He has some recipes and ingredients. Unfortunately he is not good at maths. Can you help him to find out how many cakes he could bake based on his recipes?

Write a method cakes(), which takes the recipe (hash) and the available ingredients (also a hash) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

-   input: 2 hashes:  1 representing the recipe list, 1 representing the indgredients avialable
-   output: an integer representing the maximum number of cakes possible

Questions:

-   am I repeating anything? yes diving up all the ingrdient numbers by the recipe numbers
-   am I making any choices? yes if you don't have all the ingridients listed in the recipe then return 0
-   whats the sequence of steps here?

Requirements:

-   first check if all the ingridients are there to make recipe
    -   do this by grabbing all the keys from recipe and checking if each key is available in the ingridients 
    -   if all are present continue, otherwise return 0 (its not possible to make the cake)
-   divide each of the ingridients by the number listed in the recipe. Do this for all ingredients and collect each divided number in a list
    -   based on the recipe key grab all the values in the ingridients and divide it by recipe values
    -   collect divided numbers in an array = cake_arr
-   return the minimum number in the list

Examples:

```ruby
must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 

are all the ingrdients in the recipe? yes
flour: 1200/500 = 2
sugar: 1200/200 = 6
eggs: 5/1 = 5

maximum number of cakes that can be made is 2

must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 
are all ingridients present to make the cake? no (apple, oil)
return 0
```

Data structure:

-   given recipe_hash and ingrient_hash
-   1 variable for data collection = cake_arr
-   1 iteration to check for all recipe keys present in ingrdient keys
-   1 iteration for iterating through all the recipe keys values to collect ingrdient division number using cake_arr
-   1 sort to collect minimum value in cake_arr

Algorithm:

-   initialize variable cake_arr assign it an empty array \[]
-   iterate over recipe_hash (key, value)
    -   check if all keys are included in ingrident_hash
    -   return 0 if all aren't present
-   iterate over recipe_hash (key, value)
    -   using key divide ingredient_hash value by recipe_hash value
    -   collect the result in cake_arr
-   find and return the minimum value in cake_arr 

```ruby
def cakes(recipe, ingredient)
  cake_arr = []
  return 0 unless recipe.all?{|key, _| ingredient.key?(key)}
  recipe.each {|key, _| cake_arr << ingredient[key] / recipe[key]}
  cake_arr.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
```
