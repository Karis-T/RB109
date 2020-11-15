=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Algortithm:
initialize num_arr and assign an empty array
initialize word_arr and assign all the word versions of all the numbers  
scan str and look for all words_and_periods
iterate over words_and_periods (word)
    if word is included in word_arr
        convert word to word_arr index and change to string
        push it into num_arr
    also if word is a period
        push it into the last word in num_arr
    otherwise
        push word num_arr
join all the words_and_periods together by space

=end

```ruby
def word_to_digit(str)
  num_arr = []
  word_arr = %w(zero one two three four five six seven eight nine)
  str.scan(/[\w]+|\./).each do |word|
    if word_arr.include?(word)
      num_arr << word_arr.index(word).to_s
    elsif word == "."
      num_arr[-1] << word
    else
      num_arr << word
    end
  end
  num_arr.join(" ")
end
```

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'