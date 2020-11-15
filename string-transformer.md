---
title: "String transformer"
tags: ""
---

=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

input: string
output: string 

Requirements: 

-   change the case of every character (lower to upper, upper to lower)
-   reverse the order of words from the input
-   preserve multiple spaces/leading trailing spaces
-   You may assume the input only contain English alphabet and spaces.

Questions: 
will I need to repeat anything? Yes repeating changing case for every letter
will I have to make any choices? yes because if it comes across a space ignore it

Mental Model: given a string, reverse the words in the string, and change the case of every character in a word. preserve leading and trailing space

For example:
"Example Input" ==> "iNPUT eXAMPLE"
the two words have been flipped
AND every letter has swapped case (from lower to upper and upper to lower)
spaces have been preserved

Data structure:
1 counter to count each letter thats been swapped
1 iterator to swap each character case
array of characters

Algorithm:
initialize counter to 0
split the string into word_arr
reverse word_arr
split word_arr into characters
iterate over word_arr (word)  
  iterate over word (letter)
    swap the case of each letter    

=end

def string_transformer(str)
  str.split(/\\b/).reverse.join.swapcase
end  

p string_transformer("You Know When  THAT  Hotline Bling") #== "bLING hOTLINE  that  wHEN kNOW yOU"
p string_transformer(" A b C d E f G ") #== " g F e D c B a "
