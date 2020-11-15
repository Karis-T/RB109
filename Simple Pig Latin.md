# Question: 

Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

## Understanding the problem

### Inputs and outputs

- Input: A string with words and punctuation in it
- Output: A string where the first letter of each word is placed at the back of the word followed by adding 'ay' to the end of the word

### clarifying questions

- How to place the 'P' behind the word?
- hos to add `ay` to the back of each word?
- How to determine if it's a word or punctuation?

### Rules

- if the word starts with a letter
  - pull the first letter from the front
  - and add it to the back followed by `ay`
- otherwise
  - leave the punctuation as is

## Examples

```ruby
pig_it('Pig latin is cool') # igPay atinlay siay oolcay
pig_it('Hello world !')     # elloHay orldway !
```

the `H`is shifted from the front of the word and pushed into the back followed by the words `ay` 

if it's not a word its left as is

## Data representation

- split the string into word array
- join it back together again with spaces

## Algorithm

1. take a string and split it into an array `wrd_arr`where each element is a `word`
   1. iterate over each `word` in `wrd_arr`
      1. if the word starts with `a-zA-Z`
      2. `shift` the first `letter` `word` and `push` it to the back 
      3. append `ay` to the `word`
   2. Otherwise
      1. leave the `word` as it is
2. `join` the `wrd_arr` back together again by spaces