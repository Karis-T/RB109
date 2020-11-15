---
title: "Sheldon take 2"
tags: ""
---

=begin

# Write a method that takes in a number and returns a string, placing a dash in between odd digits.

input: integer
output: string representing same digits but a dash between odd digits

requirements:
convert numbers to string
if number odd place a dash between odd digits

Mental model: 

Algortihm:

-   split each digit into array_of_digits
-   iterate over array_of_digits (a,b) 
-       split array_of_digits when a is odd and b is odd
-   iterate over array_of_digits (arr)
-       join arr together
-   join array_of_digits together with dash "-"

Algortihm:

-   split each digit into array_of_digits
-   iterate over array_of_digits (a,b) 
-       split array_of_digits into an array when a is odd and b is odd
         - array_with_subarrays          
-   iterate over array_of_digits (arr)
-       join arr together
-   join array_of_digits together with dash "-"

Algorithm:

-   convert digits to string (str)
-   iterate over str by length (idx)
      if str idx is odd and string idx plus 1 is odd
          insert a dash "-" into str at idx plus 1
-   return str    

=end

def dasherizer(int)
  int.digits.reverse.slice_when{|a,b| a.odd? && b.odd? }.map(&:join).join("-")
end  

def dasherizer(int)
  arr_of_dig = int.digits.reverse
  arr_of_dig = arr_of_dig.slice_when{ |a,b| a.odd? && b.odd? }.to_a
  arr_of_dig.map(&:join).join("-")
end

def dasherizer(int)
  str = int.to_s
  str.length.times do |num|
    str.insert(num+1, "-") if str[num].to_i.odd? && str[num+1].to_i.odd?
  end
  str
end

p dasherizer(2112) #== '21-12'
p dasherizer(201105742) #== '201-105-742'
p dasherizer(123456789) #== '123456789'
p dasherizer(21121) #== '21-121'
