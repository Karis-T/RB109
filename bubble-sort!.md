---
title: "bubble sort!"
tags: ""
---

=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

6  2  7  1  4  Start: compare 6 > 2? Yes
2  6  7  1  4  Exchange
2  6  7  1  4  6 > 7? No (no exchange)
2  6  7  1  4  7 > 1? Yes
2  6  1  7  4  Exchange
2  6  1  7  4  7 > 4? Yes
2  6  1  4  7  Exchange
2  6  1  4  7  2 > 6? No
2  6  1  4  7  6 > 1? Yes
2  1  6  4  7  Exchange
2  1  6  4  7  6 > 4? Yes
2  1  4  6  7  Exchange
2  1  4  6  7  6 > 7? No
2  1  4  6  7  2 > 1? Yes
1  2  4  6  7  Exchange
1  2  4  6  7  2 > 4? No
1  2  4  6  7  4 > 6? No
1  2  4  6  7  6 > 7? No
1  2  4  6  7  1 > 2? No
1  2  4  6  7  2 > 4? No
1  2  4  6  7  4 > 6? No
1  2  4  6  7  6 > 7? No
1  2  4  6  7  No swaps; all done; sorted
We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

input: array
output: array (in-place) / mutated 

Requirement:
contains at least 2 elements
bubble sort an array
making multiple passes (iterations)
on each pass each pair of consectuive elements are compared. 
if first is greater than second
then the 2 elements are swapped
process is repeated UNTIL a complete pass is made without performing swaps
at this point array is completely sorted

Problems/ questions:

1.  how do we know when all have been sorted?
2.  how do we mutate in place?
3.  how do we compare first vs 2nd? 

6  2  7  1  4  Start: compare 6 > 2? Yes arr[0]  > arr[1]
2  6  7  1  4  Exchange arr[0], arr[1] = arr[1], arr[0] 
2  6  7  1  4  6 > 7? No (no exchange) remains the same arr[1] > arr[2] \(every time you get
2  6  7  1  4  7 > 1? Yes arr[2] > arr[3] 
2  6  1  7  4  Exchange arr[2], arr[3] = arr[3], arr[2]
2  6  1  7  4  7 > 4? Yes 4 > 5 
2  6  1  4  7  Exchange arr[3], arr[4] = arr[4], arr[3]

1st pass
iterate again (go back to start)

2nd pass

2  6  1  4  7  2 > 6? No 
2  6  1  4  7  6 > 1? Yes 
2  1  6  4  7  Exchange
2  1  6  4  7  6 > 4? Yes 
2  1  4  6  7  Exchange 
2  1  4  6  7  6 > 7? No

2  1  4  6  7  2 > 1? Yes
1  2  4  6  7  Exchange
1  2  4  6  7  2 > 4? No
1  2  4  6  7  4 > 6? No
1  2  4  6  7  6 > 7? No

1  2  4  6  7  1 > 2? No
1  2  4  6  7  2 > 4? No
1  2  4  6  7  4 > 6? No
1  2  4  6  7  6 > 7? No
1  2  4  6  7  No swaps; all done; sorted

until all is sorted

iterate over every single element again and again

if  we get a yes to the need to swap 
we swap

if we get a no
we dont swap but we add a +1 to counter (this will track if everythings sorted)
when sorted equals the length of the array we break out of the loop

Data structure:
array in place
no new collection of elements
counter for how many times something is sorted

Algorithm:
given array (arr)
intialize sorted to 0
until arr length minus 1 equals sorted counter
    reset sorted to 0  
    iterate arr by length minus 1 (idx)
      if arr idx > arr idx plus 1
         swap arr idx for arr idx plus 1
      otherwise
          sorted increment by1
return arr          

=end

def bubble_sort!(arr)
  arr
  sorted = 0
  until (arr.length - 1) == sorted
    sorted = 0
    (arr.length - 1).times do |idx|
      if arr[idx] > arr[idx+1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
      else
        sorted += 1
      end
    end
  end
  arr  
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
