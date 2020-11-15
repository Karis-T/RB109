---
title: "weird str case"
tags: ""
---

=begin
[Kata Stats: WeIrD StRiNg CaSe \| Codewars](https://www.codewars.com/kata/52b757663a95b11b3d00062d) 
6 kyu
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').
even upcase
odd downcase
=end

def weirdcase(str)

str.chars.map.with_index { |letter, idx| idx.even? ? letter.upcase : letter.downcase }.join  

end

p weirdcase( "String" ) #== "StRiNg"
p weirdcase( "Weird string case" ) #== "WeIrD StRiNg CaSe"
