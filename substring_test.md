given 2 strings you job is to find out if there is a substring that appears in both strings. you will return true if you find a substring that appears in both strings,  or false if you do not. We only care about stubstrings that are longer than 1 letter

input: 2 strings
output: true or false (boolean value) that represents if theres a substring longer than 1 letter present in both 

clarifying questions:
whats a substring? a smaller section of a string
how do we check if it appears in all strings? all method
how do we find ones that are longer than 2 letters?

explicit requirements:
given 2 strings
find out if a substring appears in both
must be 2 letters or longer
true if there is 
false if there isn't

implicit requirements:
only need to break down 1 word

Mental Model: Find a common substring 2 letters or longer that appear in 2 strings. If there is one, return true

Examples:
"Something" "Home"
is So [0, 2] present in all? false
move up
is om [1,2] present in all? true
return true
(increment starting point by 1)

"1234567" "541265"
is 12 [0,2] present in both? true
return true

Data structure:
strings for matching purposes
array of words to see if both have the string
variable for collecting substring
variable for collecting true/false

Algortithm:
1.intialize wrd_arr assigning str1 and str2 to the array
2. iterate str1 length number of times by idx
  - intialize substring and slice the str1 by idx to 2 spaces
  - iterate over wrd_arr and check if all match the substring
  - collect the value of this in initialized variable common
  - if common is true return true
  - otherwise keep iterating

3.if nothing is found return false

```ruby
def substring_test(str1, str2)
  wrd_arr = [str1, str2]
  length = (str1.length)-1
  length.times do |idx|
    substring = str1[idx, 2].downcase
    common = wrd_arr.all? {|word| word.downcase.match?(substring)}
    return true if common
  end
  false
end

p substring_test("Something", "Fun")
p substring_test("Something", "Home")
p substring_test("1234567", "541265")
```