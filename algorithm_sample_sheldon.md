```ruby
=begin

Given the string of chars a..z A..Z do as in the sample cases

input: string
output: string with each of the letters between 

Clarifying questions:
how do i put in a dash? 
how do i put in each letter x number of times?
how do I upcase each letter?  

Requirements:
given a string
take each letter
times the letter by its position in the string
capitalize the first letter
join the letters up with a slash

Example:
"abcd"
pass in a 
a * 1
capitalize a -> A
pass in b
b * 2
capitalize bb -> Bb
pass in c
c * 3
capitalize ccc -> Ccc
pass in d
d * 4 
capitalize dddd -> Dddd

Data structure:
Arrays for joining with dash
strings for iteration
one empty array to collect the result

Algorithm:
 convert string to letter array (letter_array) 
 iterate over letter_array with index (letter, idx)
           times each letter by idx +1
           then capitalize letter
 join the result together by dash
=end

def accum(str)
  letter_arr = str.chars
  letter_arr.map.with_index do |letter, idx|
    (letter * (idx+1)).capitalize
  end.join("-")  
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"
```

```ruby
# Algorithm:
# - initialize an empty array, result
# - downcase then split the string into characters, str_array
# - iterate from 0 to the length of str_array with a parameter, idx
#     -add the upcased string to results + the string * idx 
# - join results using a hyphen and return results

def accum(string)
  result = []
  str_array = string.downcase.chars

  (0...str_array.size).each do |idx|
      result << str_array[idx].upcase + str_array[idx] * idx
  end
  result.join("-")
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"
```