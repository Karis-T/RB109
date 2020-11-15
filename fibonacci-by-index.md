---
title: "fibonacci by index"
tags: ""
---

=begin
Select the element out of the array if its index is a fibonacci number.

input: array
output: array represents the element whoes index is fibonacci

**we are not selecting index and returning them, we are selecting their corresponding element**

Question:
what is fibonacci? starting with element 1,1 add the previous two numbers together and return the result to the sequence

Requirements:
**we are not selecting index and returning them, we are selecting their corresponding element**
taking an element
checking to see if its index is fibonacci
if it is, return the element
otherwise don't return it

Mental Model:
given a serioes of elements in an array, check to see if its corresponding index is fibonacci, if it is return the element, if it isn't don't return it. 

Example:
[1,2,3,4,5,6][0,1,2,3,4,5]

grab index 0
check to see if its fibonacci
0 is not
1 is
2 is
3 is
4 is not
5 is

should return
2, 3, 4, and 6

Data structure:
arrays, selecting elements from an array

when we take the index number and check to see if its fibonacci
looping construct required, (unbounded, we don't know how many times we will iterate)

start with the sequence 1,1

Algortihm:
1 problem: select all the elements whoes index is fibonacci
given array (arr)
iterate over arr (ele, idx)
    select ele if idx is fibonacci
    if true return ele
    otherwise ignore it

2nd problem: check to see if an index is fibonacci
    given idx
    intialize fib assign it [1,1]
    while the last fib number is less than or equal to idx
        fib index -2 plus fib index -1 
        push this result to fib array

 check to see if idx is included in fib
    if is return true
    otherwise false
=end

def fib_index_select(arr)
  arr.select.with_index { |ele, idx| ele if fibonacci?(idx) }
end

def fibonacci?(idx)
  fib = [1,1]
  while fib[-1] &lt;= idx
    fib &lt;&lt; fib[-2] + fib[-1]
  end
  fib.include?(idx)
end  

p fib_index_select([1, 2, 3, 4, 5, 6]) 
p fib_index_select(('a'..'z').to_a)
