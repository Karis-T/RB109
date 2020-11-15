---
title: "triple double"
tags: ""
---

=begin
[Kata Stats: Triple trouble \| Codewars](https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
6 kyu
Write a function

which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1

# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0

# num1 has straight triple 2s but num2 has only a single 2

=end

def triple_double(num1, num2)
  arr1 = num1.to_s.chars.slice_when {|a,b| a != b}.select{|arr| arr.length == 3}.map(&:join)
  arr2 = num2.to_s.chars.slice_when {|a,b| a != b}.select{|arr| arr.length == 2}.map(&:join)
  arr2.any?{|num| arr1.first == (num + num[0])} ? 1 : 0
end

p triple_double(12345, 12345) #== 0
p triple_double(666789, 12345667) #== 1
p triple_double(451999277, 41177722899) #== 1
p triple_double(1222345, 12345) #== 0
