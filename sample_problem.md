Decomposition:

1. **input:** given a **string**
2. method is called `change_me` 
3. output: the SAME STRING with **uppercased** palindromic words
4. find the words that are a **palindrome**
5. **transform** the palindrome words into uppercase version **IF** its a palindromic word 
6. **otherwise** **IF** its not a palindrome, don't transform it
7. **output:** the same string but uppercase

Pattern Recognition:

change_me("We will meet at noon") == "We will meet at NOON"  <= only uppercases palindromes
change_me("No palindromes here") == "No palindromes here" <= doesn't uppercase if there isn't any palindromes 
change_me("") == ""  <= doesn't add words if there isn't any
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally" <= keeps uppercased words intact

Data Representation & Abstraction: 

- since we are working with string, mutating the original and returning the original object, we're going to keep using strings as the data representation

Algorithm:

get length of string

- loop string length times

- reference each letter between spaces `" "`
  if the character is not a space, 

  - start referencing it 
    for every chracter thats not a space count  
    word_length up by 1

- evaluate if the reference is true - palindrome

- if the word is same backwards as forwards

  ​	uppercase! the letter

- reset word_length counter to zero

  repeat

