---
title: "sort anagrams into hash"
tags: ""
---

=begin
Challenge: Given the array...

Copy Code
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

Copy Code
["demo", "dome", "mode"]["neon", "none"]
(etc)

=end

def sort_anagrams(arr)

  hash = {}

  unique_anagrams = arr.map do |words|
    words.chars.sort.join
  end.uniq

  group_anagrams = unique_anagrams.map do |anagram|
    arr.select do |word|
      anagram == word.chars.sort.join
    end
  end

  unique_anagrams.each_with_index do |ele, idx|
    hash[ele] = group_anagrams[idx]
  end

  hash
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p sort_anagrams(words)
