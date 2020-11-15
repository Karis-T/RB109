---
title: "Mean square error"
tags: ""
---

Complete the function that accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair.

input: 2 integer arrays of equal length
output: an integer representing the average

Questions:

-   how do i average something? add up all numbers and divide it by how many numbers there are
-   am i repeating anything? yes going through list of 1 array
-   am i making any choices? no

Requirements:
compare each value in array1 to the other in array2
absolute value of array1 minus absolute value of array2
square the result
return the average of each result
(round to 1 decimal place)

Mental model:
compare each value in one array to its counterpart position in the other array. 
find the absolute value of each and then minus the first from the second. 
square the result and return its average to 1 decimal place

Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
(arr1[0] absolute - arr2[0] absolute) = -3 ** 2 = 9
(arr1[1] absolute - arr2[1] absolute) = -3 ** 2 = 9
(arr1[2] absolute - arr2[2] absolute) = -3 \*\* 2 = 9
sum all 3 = 27
divide it by the length of the array 3 = 9 (round to 1 decimal)

[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

def solution(arr1, arr2)
	arr1.map.with_index { |_, idx| (arr1[idx].abs - arr2[idx]) \*\* 2 }.sum / arr1.length.to_f
end        

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
