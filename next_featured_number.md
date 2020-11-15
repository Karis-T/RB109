=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

input: single integer
output: returns the next featured integer greater than input. return an error message if there is no number.

Clarifying questions:
- what is a featured number? 
  an odd number thats:
  1. a multiple of 7 AND
  2. digits that occur exactly once each

Mental model: Given an integer find the next number that is a multiple of 7 AND has digits that only occur once

Examples:

featured(12) == 21
21 is a multiple of 7 AND has digits that occur once
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

Data structure
requires iteraton:
until num a multiple of 7 and its digits == digits unique
num += 1
end
=end

```ruby
def featured(num)
  return "there is no number that fufills those requirements" if num >= 9999999999
  num += 1
  until (num%7 == 0) && (num.digits == num.digits.uniq) && num.odd?
    num += 1
  end
  num
end  

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997)
p featured(1029)
p featured(999_999)
p featured(9_999_999_999)
```