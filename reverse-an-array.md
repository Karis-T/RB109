---
title: "reverse an array"
tags: ""
---

=begin
Reverse an array without using the built-in reverse method.
p reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p reverse_array!([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array!([1, 2, 3, 4]) == [4, 3, 2, 1] # mutating - just for fun
=end

def reverse_array(arr)
arr_reverse = \[]
  1.upto(arr.length) do |num|
    arr_reverse &lt;&lt; arr[-num]
  end
  arr_reverse
end

p reverse_array([1, 2, 3, 4]) #== [4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) #== [5, 4, 3, 2, 1]

def reverse_array!(arr)
  half = arr.length / 2
  idx2 = -1
  half.times do |idx|
    arr[idx], arr[idx2] = arr[idx2], arr[idx]
    idx2 -= 1
  end
  arr
end

p reverse_array!([1, 2, 3, 4, 5]) #== [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array!([1, 2, 3, 4]) #== [4, 3, 2, 1] # mutating - just for fun
