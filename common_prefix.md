write a method to find the longest common prefix string amongst an array of strings

if there is no common prefix, return an empty string ""

eg 1  
input: ["flower", "flow", "flight"]
ouptput: "fl" 

eg2 
intput: ["dog", "racecar","car"]
output: ""
Explanation:  there's no common prefix among the input strings
note: 

all given inputs are in lowercase letters a-z


input: array of strings
output: string representing common prefix 

Clarifying questions:
how do you collect common prefixs to check?
how do you check if all prefixes are the same?

Requirements:
you only need the first word

Mental model:
find the longest common prefix amongst an array of strings. if there's none return ""

Example
common_prefix["flower", "flow", "flight"]
compare f to all the strings in the array
do they all have f? true
store f away
go to the next one fl
compare fl to all the strings in the array 
do they all have fl? true
store fl away
go to the next one flo
compare flo to all the strings in the array
do they all have flo? false
if false break from the loop

return last stored prefix  

```ruby
def common_prefix(arr)
  word = arr.first
  longest_prefix = ""
  1.upto(word.length) do |lngth|
    prefix = word[0, lngth]
    pre_all = arr.all?{|words| words.match?(/#{prefix}/)}
    if pre_all 
      longest_prefix = prefix 
    else 
      return longest_prefix
    end
  end  
end
p common_prefix(["flower", "flow", "flight"])
p common_prefix(["dog", "racecar","car"])
```