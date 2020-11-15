=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

input: string representing integers
output: integer representing odd number

Requirements: 
- given a string of integers
- return the number of odd substrings out of all the substrings that can be formed
- form all the substrings
- return the length of only the odd ones

Clarifying questions:
- what is considered an odd number?
- what is a substring? Anything from 1 digit to 4 digits in the example 1341

Mental Model: Given a string of integers, form all the substrings that it can make and select only the odd ones. 
Then return the length of the odd substrings

Examples:
"1341"

1 (0,1) odd
13 (0,2) odd
134 (0,3) even
1341 (0,4) odd
3 (1,1) odd
34 (1,2) even
341 (1,3) odd
4 (2,1) even
41 (2,2) odd
1(3,1) odd

based on the length of the string, count from 1....string length

Data Structure:
array structure to collect all substrings, then select only odd ones
array variable called substrings
2 iterators:
- one will be iterating over the start count
- one will be iterating over the length count

select iterator which will grab all the odd numbers
return the length of the odd numbered array

Algorithm:
1. intialize new empty array called substrings
2. iterate over string times the length -1 of the string with 1 parameter idx
  3. iterate from 1 to string length with length as parameter

    slice the string from idx to length assign this to a variable sub_str
    push sub_str into subtrings
4. select all the odd substrings      
5. return the length of all the odd substrings
=end

```ruby
def solve(str)
  substrings = []
  str.length.times do |idx|
    1.upto(str.length-idx) {|lngth| substrings << str[idx, lngth]}
  end
  substrings.select{|num| num.to_i.odd?}.length
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
```



