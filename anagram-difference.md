---
title: "anagram difference"
tags: ""
---

=begin
Given two words, how many letters do you have to remove from them to make them anagrams?

A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.

input: given 2 strings
output: an integer representing the total number of letters that need to be removed from BOTH words to equal an anagram

Questions:
what is an anagram? 2 words that have the same amount of letters in them
do I need to repeat anything? yes iterating through both words to locate the anagram, and to count how many characters I have to remove from each word to equal anagram
Do I need to make a choice? no
what are the steps in order to get the output?

Requirements:

1.  find the anagram (maximum number of letters that appear in BOTH strings)
2.  count all the letters that are not included in the anagram in each word
3.  return the total

Mental model:
find the anagram within both words and count the total number of letters needed to be removed from each word to create the anagram

Example
First word codewars: c e ar (4 letters removed)
Second word hackerrank: c er a (6 letters removed)
Result : 10

Algorithm:
find which common letters appear in both strings

find the maximum amount of common letters that can be used to make an anagram from both strings
using the anagram delete letters from the strings
count up all the deleted letters and return the total

=end

def anagram_difference(str1, str2)
	str1.chars.select do
  	str1.chars.all?{|letter| str2.match?(letter)}
  end  
end

p anagram_difference('', '') #== 0
p anagram_difference('a', '') #== 1
p anagram_difference('', 'a') #== 1
p anagram_difference('ab', 'a') #== 1
p anagram_difference('ab', 'ba') #== 0
p anagram_difference('ab', 'cd') #== 4
p anagram_difference('aab', 'a') #== 2
p anagram_difference('a', 'aab') #== 2
p anagram_difference('codewars', 'hackerrank') #== 10
