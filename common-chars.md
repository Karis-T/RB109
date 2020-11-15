---
title: "common chars"
tags: ""
---

given an array of lowercase letter words, return an array of ALL characters that show up in all strings within the given array (including duplicates). EG. If a character occurs 3 times in all strings but not four times you need to include that character there 3 times in the final answer.

input: an array of lowercase words
output: an an array of common characters that show up in each words (including duplicates)

Questions:

-   how to collect duplicates?
-   am i repeating any task? yes grabbing one word and seeing if each character from that word shows up in all other words
-   am I making any choices? yes, if 1 letter shows up in all words, collect/return it, if it doesn't keep looking
-   what are the steps in order from start to finish?

Requirements:
grab the first word
split it into letters
check to see if a letter shows up in all words
if it does collect it
if it doesnt dump it
repeat until all letters are collected (including duplicates)
return selection

Mental model: 
collect characters that show up in all the words in a given array, including duplicates and return them in an array

Example
(["cool", "lock", "cook"]) #== ["c", "o"]

take cool
split cool up into letters
is 1 c available in all words? yes
collect c
is 1 o available in all words? yes
collect c
is 2 o available in all words? no
dump the o
is 1 l available in all words? no
dump the l

c and o are the only ones that occur in all words in the string

Data structure:

-   1 iteration of all letters to see if they occur in all words
-   empty array common_char variable to collect words
-   1 iteration to select all the letters that show up

Algorithm:
given arr
initalize occurence and assign an empty array
select the first word and split it into characters
iterate over chracters (letter)
    push letter into empty array
    iterate over arr (word)
        count how many letter is in occurence
        check if it is less than or equal to the count of the letter in word
        if it is select letter
        otherwise ignore letter
repeat until all repeating characters are selected

def common_chars(arr)
  occurence = \[]
  arr.first.chars.select do |letter| 
    occurence &lt;&lt; letter
    arr.all?{|word| occurence.count(letter) &lt;= word.count(letter)}
  end
end 

p common_chars(["cool", "lock", "cook"]) #== ["c", "o"]
p common_chars(["bella", "label", "roller"]) #== ["e", "l", "l"]
p common_chars(["hello", "goodbye", "booya", "random"]) #== ["o"]
