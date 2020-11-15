Min Window Substring
Have the function MinWindowSubstring(strArr) take the array of strings stored in strArr, which will contain only two strings, the first parameter being the string N and the second parameter being a string K of some characters, and your goal is to determine the smallest substring of N that contains all the characters in K. For example: if strArr is ["aaabaaddae", "aed"] then the smallest substring of N that contains the characters a, e, and d is "dae" located at the end of the string. So for this example your program should return the string dae.

Another example: if strArr is ["aabdccdbcacd", "aad"] then the smallest substring of N that contains all of the characters in K is "aabd" which is located at the beginning of the string. Both parameters will be strings ranging in length from 1 to 50 characters and all of K's characters will exist somewhere in the string N. Both strings will only contains lowercase alphabetic characters.
Examples
Input: ["ahffaksfajeeubsne", "jefaa"]
Output: aksfaje
Input: ["aaffhkksemckelloe", "fhea"]
Output: affhkkse

input: array of 2 strings (n, k)
output: a sub string representing the minimum letters from (n) needed to create (k)

requirements:
assume both strings range from 1 to 50 characters
assume all of k's characters exist somewhere in n
both strings only contain lowercase letters

Mental model:
find the smallest substring of n that contain all the characters of k

Example:
["aabdccdbcacd", "aad"] -> "aabd" 
a
aa
aab
aabd <- this is the smallest one that contains all letters of aad

select all substrings that match all the letters of aad
find the minimum substring by substring length

Data structure:
empty array for substring collection
2 iterators for substring collection
1 iterator to collect the minimum word

Algorithm:
initialize substr_arr assign an empty array
iterate over n by its length (idx)
    iterate from 1 to n length minus idx (lngth)
        reference n by idx, lngth and store it in substr
        if substr matches all the letters in k
        push it into substr_arr
iterate over substr_arr (sub)
  find the minimum sub by length        
=end

```ruby
def MinWindowSubstring(strArr)
  substr_arr = []
  n = strArr[0]
  k = strArr[1]

  n.length.times do |idx|
    1.upto(n.length-idx) do |lngth|
      substr = n[idx, lngth]
      substr_arr << substr if k.chars.all? {|letter| substr.count(letter) >= k.count(letter)}
    end
  end
  substr_arr.min_by{|sub| sub.length}
end

# keep this function call here 

puts MinWindowSubstring(STDIN.gets)
```