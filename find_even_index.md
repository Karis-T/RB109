You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sim of the integers to the right of N.  If there is no index that would makes this happen return -1

EG
lets say you were given the array [1,2,3,4,3,2,1]
your method would return index 3, because at the 3rd position of the array , the sum of the left [1,2,3] is equal to the right [3,2,1], both 6

EG2
you are given the array [20, 10, -80, 10, 10, 15, 35]
at index 0 the left side is []
the right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. Empty arrays are equal to 0 in this problem
index 0 is the place where the left side and right side are equal 

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

input: array of integers
output: an integer n representing the index where the sum of the integers to the left of n is equal to the right of n.

clarifying questions: 
- How do we find the number? iteration of n by its index
- how do we sum the left and right of it? sample two ranges from 0...n-1 to n+1...-1
- how do we compare the two? compare range 1 == range 2
- how do we return the numbers index? if the equality returns true return the nth index (current iterated index)     

Mental Model
find index of an array number n where the left sum of n is equal to the right sum of n. If there is no index that can do this return -1.

Examples:
[1,2,3,4,3,2,1]

idx 0 = 1
compare the left []([0,0]) == to right [2,3,4,3,2,1]([1,6]) = false
idx 1 = 2 
compare left [1]([0,1]) == [3,4,3,2,1]([2,5]) => false
idx 2 = 3
compare left [1,2][0,2] == [4,3,2,1](3,4) => false
idx 3 = 4
compare left [1,2,3][0,3] == [3,2,1](4,3) => true

output idx 3

Data structure:
array structure
index n
2 sub arrays: left and right
counter/iterator array times the length of the array

Algorithm:
1. iterate over the collection arr by length times with n as its paramenter
  - in the iteration initialize local variable left and assign it arr[0,n]
  - initialize local variable right and assign it arr[n+1..-1]
  - compare left == right
  - if equal return the current index n
  - if not equal keep iterating
2. when finished iterating if there was no index returned from the iterator return -1

```ruby
def find_even_index(arr)
  arr.length.times do |n|
    left, right = arr[0, n].sum, arr[n+1..-1].sum
    return n if left == right
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) #== 3
p find_even_index([1,100,50,-51,1,1]) #== 1
p find_even_index([1,2,3,4,5,6]) #== -1
p find_even_index([20,10,30,10,10,15,35]) #== 3
p find_even_index([20,10,-80,10,10,15,35]) #== 0
p find_even_index([10,-80,10,10,15,35,20]) #== 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) #== 3
```