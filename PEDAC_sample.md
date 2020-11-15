# Question:

As a data engineer your first task is to make vowel recognition dataset. In this task you have to find the presence of vowels in all possible substrings of the given string. For each given **string** you have to print the **total number** of **vowels**.

## Understand the Problem
### Identify input and output
- Input: String
- Output: Integer (representing the total number of vowels in all the substrings)

### Clarifying Questions:
- what is a substring?
- what is a vowel?
- What is a sum?

### Examples:
```ruby
#In given sample test case, first string is 
"baceb" 

#so the substrings are 
[b, ba, bac, bace, baceb, a, ac, ace, aceb, c, ce, ceb, e, eb, b] 

#and the number of vowels in each substring are 
[0, 1, 1, 2, 2, 1, 1, 2, 2, 0, 1, 1, 1, 1, 0]

#and the total number is sum of all elements is 
16
```
###  Rules
- Each substring must have its own vowel count
- Each letter in the `input` string is used to generate a new set of substrings 
- The `output` must be the sum of all substring vowel counts
- Lower and upper case must be accounted for

### Mental Model
"produce a list of all substrings per each letter in a string. For each substring, count the total number of vowels. Sum the total number of vowels for all substrings."

## Examples
```ruby
Input: 'abce' => 'a,' 'ab', 'abc', 'abce', 'b', 'bc', 'bce', 'c', 'ce', 'e'
Output: 8
```

## Data Structure
- Store the substring in an array `substrings`
- Store the vowel count in a local variable titled `vowel_count`
- The total number of vowels will also be contained in the `vowel_count`

## Algorithm

1. Create an empty array `sub_str` that will contain the substrings
2. Create a local variable `counter` . This variable is used to create a range of characters within the given string
3. Create a local variable `vowel_count` that will be used for counting vowels in the elements of `sub_str`
4. For each `character` in string
   - Check  if `counter` is  equal to the length of `string`
     - if true, append only `character` to `sub_str` and exit the loop or iteration
     - otherwise, append `character` up to and including `counter` to `sub_str`
     - Increment `counter` by 1
   - For each `element` in `sub_str`
     - count the amount of vowels `aeiouAEIOU` and add the amount to `vowel_count`
   - Return vowel count


