---
title: "Transform to prime"
tags: ""
---

Given a List \[] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

input: array of integers
output: integer representing the smallest number required to be included in the list so that the sum of all elements should equal the next prime number

Question:

-   what is a prime number? any number that can only be evenly divided by 1 and itself
-   do I need to repeat any task? yes we need to keep repeatedly looking for the sum of array to equal a prime numbers but also counting up each time
-   are there any choices to be made? yes if the sum of the array elements already equal a prime number we need to return the counter

Assumptions/Requirements: 

-   array length is at least 2
-   positive integers only
-   repeition of numbers in the array might occur

Mental Model:
return the number required for the sum of all elements in the array to equal the next prime number 

Examples

1- minimumNumber ({3,1,2}) ==> return (1)
3 + 2 + 1 = 6 (+0 counter) = 6
is 6 a prime? no
add 1 to counter

3 + 2 + 1 = 6 (+1 counter) = 7
is 7 prime? yes

return counter

Data Structure:
given an array called num_arr
integer counter called counter
1 iteration to increment counter up
1 iteration to check if number is prime

Algorithm:
given num_arr
initialize counter assign it 0
until sum of num_arr plus counter equals prime(n)
		increment counter by 1

return counter

prime(n)
iterate from 2 to n (denominator)
		check if one number from 2 to n is evenly divisible by denominator

return true if it is

Code:
def minimum_number(num_arr)
  counter = 0
  until prime?(num_arr.sum + counter)
    counter += 1
  end
  counter 
end

def prime?(num)
  (2..num).one?{|den| num % den == 0}
end  

p minimum_number([3,1,2]) #== 1
p minimum_number([5,2]) #== 0
p minimum_number([1,1,1]) #== 0
p minimum_number([2,12,8,4,6]) #== 5
p minimum_number([50,39,49,6,17,28]) #== 2
