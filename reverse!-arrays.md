---
title: "reverse! arrays"
tags: ""
---

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

input: array
output: array mutated of digits in reverse

questions:

-   do i need to repeat anything? yes sorting from one side to the other over and over
-   do I need to make any choices? no
-   what are the steps in order? 
    -   iterate half of the arrays length, and flip each outer element to the other side until there are no more left to flip

Mental model:
given an array take each outer elements and swap it with its counterpart on the other side. Work your way inward repeating the task until there are no more left to swap.

Examples: 
[1,2,3,4]

4 idx == -1 or 3
1 idx == -4 or 0
3 idx == -2 or 1
2 idx == -3 or 2

swap -1(counting up) with -4 (counting down)
swap -2(counting up) with -3 (counting down)

Data structure:
half = array length / 2
counter = array length
1 iteration for counting from 1 to half

def list(arr)
	half = arr.length / 2
  counter = arr.length
  1.upto(half) do |idx|
  	arr[-idx], arr[-counter] = arr[-counter], arr[-idx]
    counter -= 1
	end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = \[]
reverse!(list) == \[]
list == \[]
