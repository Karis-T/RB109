---
title: "sample of array of even numbers"
tags: ""
---

=begin
imagine a sequence of consecutive even integer beginning with 2. The integers are groupes in rows with the first row containing 1 integer, the second containing 2 integers and the third row three integers and so on. Given an integer representing the number of a particular row, return the integer representing the sum of all the integers in that row.

arr = [2,4,6,8,10,12,14,16,18,20]

row = (1..4).reduce(:+)

arr_new = \[] 

lngth = 1

until arr.empty?
  sub_arr = arr.slice!(0,lngth)
  arr_new &lt;&lt; sub_arr
  lngth += 1
end
arr_new.map!(&:sum)

p arr_new

p row

Algorithm:

given num
initialize an empty array arr_row
add each number together from 1 to num and times it by 2(include odd numbers). store it in total

iterate from 1 to total (n)
    select all the n elements that are even
store result in arr

iterate from 1 to num (lngth)
    permanently remove arr index 0 by lngth -> sub_array
    append sub_array to arr_row

iterate over arr_row (array)
    sum all the array elements together

return a reference of arr_row, num minus 1 

=end

def sum_of_even_row(num)
  arr_row = \[]
  total = (1..num).sum \* 2
  arr = (1..total).select(&:even?)
  1.upto(num) { |lngth| arr_row &lt;&lt; arr.slice!(0,lngth) }
  arr_row.map(&:sum)[num-1]  
end

p sum_of_even_row(4)
