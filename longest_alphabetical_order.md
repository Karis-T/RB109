=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

input: string
output: string representing the longest alphabetical substring

Requirements:
only lowercase letters
strings up to 10000 characters long must be efficient

Clarifying questions:
how to determine it is sorted alphabetically? (use sort)

Mental model: output the longest substring thats in alphabetical order

examples:
'nab'
n true
na false
nab false
a true
ab true
b true

longest is ab

Algorithm:
alpha_arr
iterate over str by length (idx)
  iterate from 1 to str by length minus idx (lngth)
    reference str by idx, lngth, store into substr
    if substr equals sorted substr
      store it into alpha_arr

iterate over alpha_arr (substr)
  find the maximum substr by length      
=end

def longest(str)
  alpha_arr = []
  str.length.times do |idx|
    1.upto(str.length - idx) do |lngth|
      substr = str[idx, lngth]
        alpha_arr << substr if substr == substr.chars.sort.join
    end
  end
  alpha_arr.max_by{|substr| substr.length}  
end  

def longest(str)
  str.chars.slice_when { |a, b| a < b }.to_a
end

p longest('asd') #== 'as'
p longest('nab') #== 'ab'
p longest('abcdeapbcdef') #== 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') #== 'aaaabbbbctt'
p longest('asdfbyfgiklag') #=='fgikl'
p longest('z') #== 'z'
p longest('zyba') #== 'z'