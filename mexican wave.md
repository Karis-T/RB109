=begin
create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

input: string
output: array with each element has an uppercase letter

Requirements: 
- given a string (assume string is all lowercase)
- each consecutive element has only a single letter that's uppercase
- return the array

Mental model: Given a string return that string times the number of letters, then each element has a consecutive upper case letter. Return this array

Example:
"hello" has 5 letters 
"hello" * 5
["hello", "hello", "hello", "hello", "hello"]
according to each index upcase that letter
["Hello", "hEllo", "heLlo", "helLo", "hellO"]
arr[0][0]
arr[1][1]
arr[2][2]
arr[3][3]
arr[4][4]

Data Structure:
strings
array
new variable wave_arr - empty array

Algorithm:
1. start with a string wrapped in an array times it by its length
2. map the array with parameters word and index
3. split each word into character array and assign it to letter_arr
4. uppercase each letter by index permanently
5. join the string back together
6. take wave_arr  and select any words that don't have uppercase letters

```ruby
def wave(str)
  wave_arr = [str] * str.length
  wave_arr.map!.with_index do |word,index|
    letter_arr = word.chars
    letter_arr[index].upcase!
    letter_arr.join
  end
  wave_arr.select { |word| word.match?(/[A-Z]/)}
end  

p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") #== ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") #== []
p wave("two words") #== ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") #== [" Gap ", " gAp ", " gaP "]
```