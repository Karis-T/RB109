---
title: "Where my anagrams at?"
tags: ""
---

=begin
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

input: string and an array of strings
output: array of strings representing the anagrams of the string input

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

=end

def anagrams(str, arr)
  arr.select{ |word| word.chars.sort == str.chars.sort }  
end  

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) #== ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) #== ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) #== \[]
