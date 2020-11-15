Question:

In this kata you are required to, given a string, replace every letter with its position in the alphabet. 

If anything in the text isn't a letter, ignore it and don't return it.

`"a" = 1`, `"b" = 2`, etc.

## Understand the Problem

### Inputs and outputs 

- Input:  string
- Output : a string with spaces in between each number

### clarifying questions:

- What is considered a letter?
- What is a letter's position in the alphabet?
- What isn't a letter?

### Rules:

- a letter is anything from a-z or A-Z
- a letters position in the alphabet is from 0-26 case insensitive
- anything that's not a-z or A-Z including spaces, numbers and other punctuation

### Mental Model:

"a string is given and based on the English alphabet, return a string representation of the numbers of where each letter in the string is located - from 0-26." 

## Examples

```ruby
alphabet_position("The sunset sets at twelve o' clock.")
=> "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
```

## Data representation

- work with hash, as we are doing dictionary lookup, eg. a = 1, b = 2....
- also working with array to change each letter according to its number

## Algorithm

- initialize `num` and assign it to the integer 1
- initialize `alphabet` and assign it to an empty hash `{}`
- iterate over an array of letters a-z
  - for each letter in the array place it in the empty hash as a key with the value of `num`
  - increment `num` by `1`
- `alphabet` should have a full hash of key/value pairs
- delete from `string` anything that  isn't `a-zA-Z`
- map over the `string` by its character
  - for each character reference the hash key
- join the result together to form a string with `" "` between each number
- result is returned from the method

```ruby
def alphabet_position(word)
  hash = {}
  ("a".."z").each_with_index do |letter, idx|
    hash[letter] = idx+1
  end

  word.chars.map do |letter|
    letter = hash[letter.downcase]
  end.compact.join(" ")
end

p alphabet_position("The sunset sets at twelve o' clock.")
```