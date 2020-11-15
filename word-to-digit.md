---
title: "word to digit"
tags: ""
---

=begin
Word to Digit
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

input: string (sentence)
output: same string but converted to digits (instead of words)

Requirements:
don't change any word except numbers
consider punctuation
spaces inbetween numbers
use the index of a number to match the corresponding word

Data structure:
array
array of numbers 

Algorithm:

-   intialize array of letter_num (from zero to nine)
-   split up the sentence into array of words (wrd_arr)
-   iterate over wrd_arr by length (idx)
-       if wrd_arr's idx is included in letter num
            word is updated to letter_nums index to str
        also if wrd_arr's idx is "."
          push "." inside the previous element iterated
-   delete any "." leftover in wrd_arr
-   join wrd_arr back together by space " "

=end

def word_to_digit(str)
  wrd_arr = str.scan(/\\w+|./)
  letter_num = %w(zero one two three four five six seven eight nine)
  wrd_arr.length.times do |index|
    if letter_num.include?(wrd_arr[index])
      wrd_arr[index] = letter_num.index(wrd_arr[index]).to_s
    elsif wrd_arr[index] == "."
      wrd_arr[index-1] &lt;&lt; wrd_arr[index]
    end
  end
  wrd_arr.delete(".")
  wrd_arr.join(" ")
end  

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
