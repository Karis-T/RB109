---
title: "is integer array?"
tags: ""
---

=begin
[Kata Stats: Is Integer Array? \| Codewars](https://www.codewars.com/kata/52a112d9488f506ae7000b95)
6 kyu
Write a function with the signature shown below:

def is_int_array(arr)
  true
end
returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

return false if element is not a float or an integer

=end

def is_int_array(arr)
  return false if arr.nil? || arr.is_a?(String)
  arr.all? { |ele| ele.is_a?(Integer) || ele.is_a?(Float) } && arr.all? { |ele| ele.to_i.to_f == ele } ? true : false
end

p is_int_array(\[])#, true, "Input: \[]")
p is_int_array([1, 2, 3, 4])#, true, "Input: [1, 2, 3, 4]")
p is_int_array([-11, -12, -13, -14])#, true, "Input: [-11, -12, -13, -14]")
p is_int_array([1.0, 2.0, 3.0])#, true, "Input: [1.0, 2.0, 3.0]")
p is_int_array([1, 2, nil])#, false, "Input: [1,2, nil]")
p is_int_array(nil)#, false, "Input: nil")
p is_int_array("")#, false, "Input: ''")
p is_int_array([nil])#, false, "Input: [nil]")
p is_int_array([1.0, 2.0, 3.0001])#, false, "Input: [1.0, 2.0, 3.0001]")
p is_int_array(["-1"])#, false, "Input: ['-1']"
