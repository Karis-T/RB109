---
title: "Pedac Problem Solving"
tags: ""
---

## Question:

As a data engineer your first task is to make vowel recognition dataset. In this task you have to find the presence of vowels in all possible substrings of the given string. For each given **string** you have to print the **total number** of vowels.

## Understand the Problem

### 1. Identify input and output

-   Input: String
-   Output: Integer (representing the total number of vowels in all the substrings)

### 2. Clarifying Questions:

-   what is a substring?
-   what is a vowel?
-   What is a sum?

### 3. Examples:

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

### 4. Rules

-   Each substring must have its own vowel count
-   Each letter in the `input` substrings is used to generate a new set of 
-   The `output` must be the sum of all substring vowel counts
-   Lower and upper case must be accounted for

### 5. Mental Model

for every substring, in a given string, count the number of vowels present in that substring and then sum it alltogether

## Examples

'abce'
'a,' 	[0,1] 1 vowel  
'ab', [0,2] 1
'abc' [0.3] 1
abce, [0,4] 2
'b', 	[1,1] 0
'bc', [1,2] 0
'bce',[1,3] 1
'c', 	[2,1] 0
'ce', [2,2] 1
'e'		[2,3] 1

total 8

## Data Structure

-   strings and arrays for counting
-   2 iterators
-   Store the substring in an array `substrings`
-   Store the vowel count in a local variable titled `vowel_count`

## Algorithm

initialize the variable vowel_count and assign it an empty array
iterate over str by its length times (idx) 
		iterate from 1 to string length minus idx (lngth)
    initialize substr and assign it a str reference [idx, lngth]
		count the number of vowels - aeiou present in substr
    push the number into vowel_count array
sum all the numbers in vowel_count

## Code

def total_substr_vowels(str)
	vowel_count = \[]
  str.length.times |idx|
  	1.upto(str.length-idx) |lngth|
    	vowel_count &lt;&lt; str[idx, lngth].count("aeiou")
    end
  end
  vowel_count.sum
end
