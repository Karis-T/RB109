---
title: "exponent method"
tags: ""
---

=begin
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

Note: The \*\* operator has been disabled.
=end

def power(num1, num2)
  return nil if num2 &lt; 0
  return 1 if num2 == 0 
  ([num1] _ num2).reduce(:_)
end

p power(2, 3) #== 8
p power(10, 0) #== 1
p power(-5, 3) #== -125
p power(-4, 2) #== 16
p power(10, 0) #== 1
p power(2, 3) #== 8
p power(3, 2) #== 9
p power(-5, 3) #== -125
p power(-4, 2) #== 16
p power(8, -2) #== nil
