##Question:

the maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in array of integers:

max_sequence[-2, 1,-3, 4, -1, 2, 1, -5, 4]
should be 6: [4, -1, 2, 1] 

easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array/. If the array is only made up of negative numbers, return 0 instead.

empty array is considered to have zero greatest sum. Note that the emty array is also a valid subarray


input: array
Output: integer representing the sum of the highest sequence

clarifying questions:
what is contiguous? 
together or next in a sequence

what is a subsequence? 
a sequence derived from another sequence by deleting some or no elements without changing the order of the remaning elements. 

how do we collect subsequences?

#Mental model:
find max sum of a subsequence of numbers in an array. If all the numbers in the array are neg, return 0. If all are positive return the sum of the whole array. 

Example
[-2, 1,-3, 4, -1, 2, 1, -5, 4]
-2 [0, 1]
-2, 1 [0, 2]
-2, 1, -3 [0, 3]
-2, 1, -3, 4 [0, 4]
-2, 1, -3, 4, -1 [0, 5]

1 [1, 1]
1, -3 [1, 2]

```ruby
def max_sequence(arr)
  return 0 if arr.empty? || arr.all?{|ele| ele < 0} 
  max_arr = []
  arr.length.times do |idx|
    1.upto(arr.length) {|lngth| max_arr << arr[idx, lngth].sum}
  end
  max_arr.max
end
p max_sequence([-2, 1,-3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
```