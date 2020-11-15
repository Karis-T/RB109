---
title: "revrot"
tags: ""
---

=begin
[Kata Stats: Reverse or rotate? \| Codewars](https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991)
6 kyu
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes(to the power of 3) of its digits is evenly divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If

sz is &lt;= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"

if each digit in arr is to the power of 3 then sum all digits then divide it by 2 == 0
reverse arr
otherwise
rotate arr to the left by 1
=end

def revrot(str, int)
  return "" if str.length &lt; int || int == 0
  num_arr = str.chars.each_slice(int).map{ |arr| arr.map(&:to_i) }
  num_arr = num_arr.select { |arr| arr.length == int }
  num_arr.map do |arr|
    if arr.map{|i| i\*\*3}.sum % 2 == 0
      arr.reverse
    else
      arr.rotate
    end
  end.join
end

p revrot("1234", 0) #== ""
p revrot("", 0) #== ""
p revrot("1234", 5) #== ""
p revrot("733049910872815764", 5) #== "330479108928157"
p revrot("123456987654", 6) #== "234561876549"
p revrot("123456987653", 6) #== "234561356789"
p revrot("66443875", 4) #== "44668753"
p revrot("66443875", 8) #== "64438756"
p revrot("664438769", 8) #== "67834466"
p revrot("123456779", 8) #== "23456771"
p revrot("", 8) #== ""
p revrot("123456779", 0) #== ""
p revrot("563000655734469485", 4) #== "0365065073456944"
