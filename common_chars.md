given an array of lowercase letter words, return an array of ALL characters that show up in all strings within the given array (including duplicates). EG. If a character occurs 3 times in all strings but not four times you need to include that character there 3 times in the final answer.

input: array of lowercase letter words
output: array of all characters that appear in each word - including duplicates

clarifying questions:
- how do we account for duplicates?
- how do we check if the character appears in all strings in the array?
- how do we select and return the chracter if it does appear in all strings?    

Explicit equirements:
- return an array of all characters that show up in all strings within given array
- eg if a character occurs 3 times in all strings but not 4, you must include that character 3 times

Implicit requirements:
- you only need the chars from the first word
- if a letter does not appear in all of them return false
- only output true answers

Mental Model:
in a given array of words, find all the letters that appear in each word including duplicates and return them in a single array

Examples:
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]

grab the word bella and break it down "b" "e" "l" "l" "a"
how many b's? = 1
1 time see if b matches all strings
return false (don't select b)
how many e's? = 1
1 time see if e match all strings
return true (select e)
how many l's? = 2
2 times see if l matches all strings
return true (select l) (1 * l)
return true (select l) (2 * l)
how many a's? = 1
1 time see if a matches all strings
return false (don't select a)

[e, l, l] is selected and returned from the method

p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]

Data structure
arrays for the original object passed in
mostly working with integers and strings


Algorithm
1. select the first word from the array and break it into chracters
2. find the uniq characters and store it in unique 
2 .count the current letter in the orignal word and store it into total
3. iterate over the word 1 to total times
4. check to see if all the words contain the current letter total number of times
5. return true or false if it does or doesnt
6. return the letters that appear in all of them

```ruby
def common_chars(arr)
  arr_letters = arr.first.chars
  temp_arr = []
  arr_letters.select do |letter|
    temp_arr << letter
    total = temp_arr.count(letter)
    arr.all?{|word| word.count(letter) >= total }
  end
end      

p common_chars(["cool", "lock", "cook"]) #== ["c", "o"]
p common_chars(["bella", "label", "roller"]) #== ["e", "l", "l"]
p common_chars(["hello", "goodbye", "booya", "random"]) #== ["o"]
```