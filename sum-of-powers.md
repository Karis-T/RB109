---
title: "sum of powers"
tags: ""
---

# Some numbers have funny properties. For example:

# 

# 89 --> 8¹ + 9² = 89 \* 1

# 

# 695 --> 6² + 9³ + 5⁴= 1390 = 695 \* 2

# 

# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 \* 51

# 

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

# 

# we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k \* n.

# In other words:

# 

# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n \* k

# 

# If it is the case we will return k, if not return -1.

# 

# Note: n and p will always be given as strictly positive integers.

=begin
input: positive integer n written as digits, and positive integer p
output: positive integer k (if it exists) representing the sum of the digits of n (first number in input) taken to powers of p which is equal to k \* n

Requirements:
if there is no k, output -1
strictly positive integers only

Mental model: 
we want to check if each digit in n starting from the power of p to the length of the digit can be evenly divided by n

take each digit apart
put this digit to the power of p
repeat it length of n times

Data Stucture:
1 iterator loop from p to the length of n
array of digits
sum the digits
empty array for collection call powers

Algorithm:
given n, and p
initialize digit_arr and assign split n into digits
iterate over each digit (digit)
    digit to the power of p, collect result in powers
    increment p by 1

sum all the elements of powers together
divide result by n
    if it is evenly divided, return k
    otherwise return -1

=end

def dig_pow(n, p)
  digit_arr = n.digits.reverse
  powers = \[]
  digit_arr.each do |digit|
    powers &lt;&lt; (digit \*\* p)
    p += 1
  end
  powers.sum % n == 0 ? powers.sum / n : -1 
end  

# [8, 81]

p dig_pow(89, 1) #== 1 # since 8¹ + 9² = 89 = 89 _ 1 
p dig_pow(92, 1) #== -1 # since there is no k such as 9¹ + 2² equals 92 _ k
p dig_pow(695, 2) #== 2 # since 6² + 9³ + 5⁴= 1390 = 695 _ 2
p dig_pow(46288, 3) #== 51 # since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 _ 51
