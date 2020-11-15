---
title: "palindrome? without reverse"
tags: ""
---

=begin
Write a method to determine if a word is a palindrome, without using the reverse method.

input:string
output: boolean (true or false)

Question: 
What is a palindrome?
the word forwards is the same as the word backwards

Requirement:
case sensitivity included
do not use the built in reverse method
Build out own reverse method
check to see if string forward is the same as string backwards

Mental model: check to see if a word is palindrome by comparing the word forwards to the word backwards without using the built in reverse method. Case sensitive

Examples:
hello &lt;- olleh == false

0, 1, 2, 3, 4
\-5 -4, -3, -2, -1 forwards
\-1, -2, -3, -4, -5 backwards(reversed)

Wow &lt;- woW == false
wow &lt;- wow == true

Algorithm:
2 problems:
1st problem: check to see if the word forwards is equal to the word backwards
    if it is return true, 
    otherwise false

2nd problem: build our own reverse method
    intialize empty str (reverse_str)
    iterate from 1 to string length(idx)
    push the negative version of string idx into reverse str    

=end

def palindrome?(str)
  str == reverse(str)
end  

def reverse(str)
  reverse_str = ""
  1.upto(str.length) do |idx|
     reverse_str &lt;&lt; str[-idx]
  end
  reverse_str
end  

p palindrome?("hello") == false
p palindrome?("Wow") == false
p palindrome?("wow") == true
