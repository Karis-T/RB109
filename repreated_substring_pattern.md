=begin
given a non-empty string, check to see if it can be constructed by taking a substring and appending multiple copies of the substring together. You may assume the give string consists of lowercase english letters only

input: 'abab'
output: True
Explanation: It's the substring ab twice

input: 'aba'
output: false
Explanation: there is no substring that can be repeated to equal the string

input: a non-empty string
output: boolean true or false

Clarifying questions:
- what is a substring? any string starting from beginning to half of the string   
- how do I extract a substring
- how to append multiple copies?

Requirements:
- lowecase english letters only
- non-empty string
- check to see if total string is made up by repeating a substring of itself
- to do this append multiple copies of the substring to itself until it equals the string
- if it doesnt return false, if it does return true
- start from the beginning

Mental Model:
given a non empty lowercase lettered string, see if a substring of the total string can equal the string by appending multiple copies of the substring to itself. If it can return true otherwise return false.

Examples:
"abab"
a
aa
aaa
aaaa == "abab"? no
*don't exceed string length

ab
abab == "abab"? yes
*keep iterating until it equals string length

*no need to analyse strings past half way of the string - it will be false

Data structure:
strings no need for arrays
empty string variable = for substrings
2 iterators, one appending substrings, one being a multiplier

only append strings to half of the string length
break multiplier if it exceeds string length
return true if its equal otherwise false

Algorithm:
1. initialize a variable sub_str and assign it to an empty string
2. iterate each letter of string with paramenter letter
3. append letter to sub_str
4. break if sub_str length is greater than half the string length
5. iterate from 1 to string length with multiplier as a parameter 
6. times substring by multiplier
7. break if substring times multipler exceeds length of string
8. check to see if it is equal to str
9. if it is return true 
10. otherwise false
=end

```ruby
def repeated_substring_pattern?(str)
  sub_str = ""
  half = str.length/2
  str.each_char do |letter|
    sub_str << letter
    break if sub_str.length > half
    1.upto(str.length) do |multipler|
      break if (sub_str * multipler).length > str.length
      return true if (sub_str * multipler) == str
    end
  end
  false
end

p repeated_substring_pattern?("abab") #== true
p repeated_substring_pattern?("aba") #== false
p repeated_substring_pattern?("aabaaba") #== false
p repeated_substring_pattern?("abaababaab") #== true
p repeated_substring_pattern?("abcabcabc") #== true
```