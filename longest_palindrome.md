Find the length of the longest substring in the given string that is the same in reverse

EG. if the input was "I like racecars that go fast",  the substring "racecar" length would be 7

If the length of the string is 0, return 0

"a" => 1
"aab" => 2
"abcde" => 1
"zzbaabcd" => 4
"" => 0

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

Understanding the problem:
input: string
output: integer representing the longest palindrome found in the string

Clarifying questions:
- what is a substring?
- how to verify if its a palindrome?
- how to get the longest palindrome?
- how to verify if its empty?

Requirements:
- get the length of the longest substring in the given string
- the substring has to be a palindrome
- if its an empty string return 0

Mental model:
Find the longest substring in a given string and check to see if its a palindrome, if it is return the length

Example:
"aab" == 2
a   [0,1]  true, == 1 
aa  [0,2]  true == 2
aab [0,3]  false
a   [1,1]  true == 1
ab  [1,2]  false
b   [2,1]  true == 1

collect and store palindromes 
find the max
find the max length

Data stucture:
array of characters 
2 counters , 1 that checks the length and 1 that checks the starting point
an empty array (to collect palindromes)
variable substring

Algorithm:
0. if str is empty return 0
1. initialize variable palindrome and assign it an empty array
2. intitalize variable str_arr assign it the chracters of str
3. iterate over str arr times its length with idx as a parameter
   - iterate again from idx to str_length with lngth as parameter
   - slice off substring from idx to lngth and compare it to its reverse
   - if true store it in palindromes
   - otherwise iterate again

4. select the max from palindrome and grab its length 

```ruby
def longest_palindrome(str)
  return 0 if str.empty?
  palindrome = []
  str_lngth = str.chars.length

  str_lngth.times do |idx|
    idx.upto(str_lngth) do |lngth|
      substr = str[idx, lngth]
      palindrome << substr if substr == substr.reverse
    end 
  end
  palindrome.max_by{|string| string.length}.length
end  

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
```