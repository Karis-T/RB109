=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

input:array
output:integer representing counted pairs

Requirements:
- if array is empty return 0
- count all pairs in the array
- return the count

Mental model: Count all the pairs in the array and return number of pairs found

Example:
[1, 2, 2, 20, 6, 20, 2, 6, 2]
[1, 2, 20, 6] -> the uniq items in the array

Algorithm:
1. grab the uniq items in the array assign it to unique_arr
2. initialize a variable called pairs and assign it 0
3. iterate over unique_arr and with num as parameter
4. for each num in unique_arr count the number of nums in the original array
5. divide the result by 2 and add it to pairs counter
6. return the counter
=end

```ruby
def pairs(arr)
  uniq_arr = arr.uniq
  pairs = 0 
  uniq_arr.each {|num| pairs += arr.count(num)/2}
  pairs
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
```