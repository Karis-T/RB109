Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Understanding the problem:

input: array
output: an array where each number has been pulled forward by 1 and the first element put to the back

Explicit requirements:

- rotate an array by
  - moving the first element to the end of the array
  - The original array should NOT be modifiec
  - do not use #rotate or #rotate!

Clarifying questions: 

- what does it mean to rotate? - pull each one to the front and the first one to the back
- how do we move an element forward by 1 - minus the index of each element by 1
- how do we not mutate it? - put it into a new array

Problem Domains: n/a

Mental model: given an array of elements, have each element move forward by 1 and the first element pushed to the back. Return that array

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

1 moves from idx 0 to idx -1
2 moves from idx 1 to idx 0
3 moves from idx 2 to idx 1
4 moves from idx 3 to idx 2

Data Representation

- Arrays only, working with the index and element of each array
- a new array is needed as we are trying not to mutate
- counter for the new array eg, new_array[-1] = 1 starting at -1 and counting up

Algorithm:

1. initialize a local variable rotated_arr populated with nil * the length of the array
2. iterate over the original array by elment and index
3. for every element in the array

  -  assign it to a position in the rotated_arr starting off with idx -1 and counting up by 1

5. return the rotated array  

```ruby
def rotate_array(arr)
  # initialize a local variable rotated_arr populated with nil * the length of the array
  rotated_arr = [nil] * arr.length
  # iterate over the original array by elment and index
  # for every element in the array
  # assign it to a position in the rotated_arr
  # starting off with idx -1 and counting up by 1
  arr.each_with_index {|ele, idx| rotated_arr[idx-1] = ele}
  # return the rotated array
  rotated_arr
end

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
```

```ruby
def rotate_array(array)
  array[1..-1] + [array[0]]
end
```

Write a method that can rotate the last n digits of a number. Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

Understanding the problem: 
input: 2 integers, 1 represents a series of digits, the other is the representing the total number of digits to rotate from the right
output: integer with rotates numbers

Requirements:
- rotate the last n digits of a number 
- rotating 1 digit results in the original number being returned
- n is always a positive integer
- use the original rotate_array method (takes an array)

Clarifying Questions:
- how do we collect the right most digits using n?
- How do we inccorporate the original rotate_array method? convert to array
- how do we combine the digits back together?
- how do we convert array back to digits?
  

Mental Model:
Given a mult-digit number and an integer n that represents how many digits to rotate from the last digit backwards, rotate the array according to the number indicated by n. Then return the rotated multidigit number

Examples:
rotate_rightmost_digits(735291, 1) == 735291
grab 1 number, rotate it and push it back together with the rest of the numbers 
rotate_rightmost_digits(735291, 2) == 735219
grab 2 numbers 9, 1 using range -2..-1, rotate them and push them back together
rotate_rightmost_digits(735291, 3) == 735912
grab 3 numbers 2, 9, 1 using range -3..-1 rotate them and push them back together
rotate_rightmost_digits(735291, 4) == 732915
grab 4 numbers 5, 2, 9, 1 using range -4..-1 rotate them and push them back together
rotate_rightmost_digits(735291, 5) == 752913
grab 5 numbers 3, 5, 2, 9, 1 using range -5..-1 rotate them and push them back together
rotate_rightmost_digits(735291, 6) == 352917
grab all 6 numbers 7, 3, 5, 2, 9, 1 using range -6...-1 rotate them and push them back together

Data Representation: 
convert digits to array
chop array according to the number
take chopped array and rotate elements
push chopped array back together to other array
convert array back to digits

Algorithm:
given a multi_digit and a number n

1. convert multi_digit to array
2. slice! the array from last index to -n index, save it in chop_arr
3. pass in chop_arr into the rotate_array method as an argument
4. return rotated array and reassign to chop_arr
5. push chop arr back into original array
6. convert the array back into digits  
=end

```ruby
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(multi_digit, n)
  # convert multi_digit to array
  array = multi_digit.digits.reverse
  # slice! the array from last index to -n index, save it in chop_arr
  chop_arr = array.slice!(-n..-1)
  # pass in chop_arr into the rotate_array method as an argument. reassign chop_arr
  chop_arr = rotate_array(chop_arr)
  # push chop_arr back to original array
  array.push(chop_arr)
  # convert back into digits
  array.join.to_i
end  

p rotate_rightmost_digits(735291, 5)
```

=begin
Rotation (Part 3)
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
=end

```ruby
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(multi_digit, n)
  array = multi_digit.digits.reverse
  chop_arr = array.slice!(-n..-1)
  chop_arr = rotate_array(chop_arr)
  array.push(chop_arr).join.to_i
end 

def max_rotation(int)
  array = int.digits.reverse
  array.length.downto(1) {|n| int = rotate_rightmost_digits(int, n)}
  int
end 

p max_rotation(735291) == 321579
```