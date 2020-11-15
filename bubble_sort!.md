Bubble Sort
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

break when all numbers is less than num+1
We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

length -1 times 
idx > idx +1

input: array of at least 2 elements
output: array sorted in place(mutated)

Mental model: cycle over an array a number of times comparing if each number is greater than the one that comes after it. if it is switch it, otherwise keep it in place. Return the same array when all items are in ascending order.

6	2	7	1	4	Start: compare 6 > 2? Yes [0] > [1]
2	6	7	1	4	Exchange
2	6	7	1	4	6 > 7? No (no exchange) [1] > [2] 
2	6	7	1	4	7 > 1? Yes [2] > [3]
2	6	1	7	4	Exchange 
2	6	1	7	4	7 > 4? Yes [3] > [4]
2	6	1	4	7	Exchange

2	6	1	4	7	2 > 6? No [0] > [1] 
2	6	1	4	7	6 > 1? Yes [1] > [2]
2	1	6	4	7	Exchange
2	1	6	4	7	6 > 4? Yes [2] > [3]
2	1	4	6	7	Exchange
2	1	4	6	7	6 > 7? No [3] > [4]

2	1	4	6	7	2 > 1? Yes [0] > [1]
1	2	4	6	7	Exchange
1	2	4	6	7	2 > 4? No [1] > [3]
1	2	4	6	7	4 > 6? No [2] > [3]
1	2	4	6	7	6 > 7? No [3] > [4]

1	2	4	6	7	1 > 2? No [0] > [1]
1	2	4	6	7	2 > 4? No [1] > [2]
1	2	4	6	7	4 > 6? No [2] > [3]
1	2	4	6	7	6 > 7? No [3] > [4]
1	2	4	6	7	No swaps; all done; sorted

Data Structure:
arrays
no variables because we're mutating
2 iterators: 
outer loop - for how many times the sorting happens,  
inner loop - for each index we compare and swap if need to

Algorithm:
0. initialize sorted assigned to 0
1. iterate the array length -1 times
  2. iterate again length-1 times with idx as a parameter

     select numbers idx and idx+1 from array
     compare if idx is greater than idx+1
       if it is parallel swap values in place
     otherwise
       sorted += 1

  break if sorted == length -1    
  reset sorted to 0
3. return sorted array

```ruby
def bubble_sort!(arr)
  loop do
    sorted = 0
      (arr.length-1).times do |i|
        if arr[i] > arr[i+1] 
          arr[i], arr[i+1] = arr[i+1], arr[i] 
        else
          sorted += 1
        end
      end
    break if sorted == arr.length-1
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
```