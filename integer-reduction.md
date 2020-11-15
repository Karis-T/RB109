---
title: "Integer reduction "
tags: ""
---

=begin
you are given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

input: n, representing digits, and k representing the number of digits to remove from n
output: string representing the lowest valued substring returned 

without changing the order remove k digits from n and return lowest possible number

=end

def solve(n, k)
  n = n.to_s.chars
  k.times do
    digit = n.min_by {|num| (n - [num]).join.to_i }
    n.delete(digit)
  end
  n.join
end

p solve(123056,4) #== '05'
p solve(1284569,2) #== '12456'
