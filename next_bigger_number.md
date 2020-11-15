you have to create a method that takes a positive integer and returns the next bigger number formed by the same digits

12 => 21
513 => 531
2017 => 2071

if no bigger number can be composed using those digits, return -1

  9 => -1
111 => -1
531 => -1

p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(9) == -1
p next_bigger_num(111) == -1
p next_bigger_num (531) == -1
p next_bigger_num (123456789) == 123456798

input: integer
ouput: integer with the next biggest number

Clarifying questions: 
What is the next biggest number?
how to determine the next biggest number?

Mental Model: Return the next biggest number formed by the same digits

Example:
12
take the last number = 2
swap it with the next number = 1
is 21 greater than 12? yes
return 21

513
take the last number = 3
swap it with the next number = 1
is 531 bigger than 513 ? yes
return 531

531 == 531.sort?
return -1

2721
take -1 = 1
swap it with -2 = 2
is 2712 > 2721 false
take -2 = 2
swap it with -3 = 7
is 2271 > 2721 false
take -3 = 7 
swap it with -4 = 2
7212 > 2721 true
grab all the other number below it
212
sort these numbers
122
join it back
7122

Data Structure:
Array of digits

Algorithm:
0. initialize num_arr
1. initialize dup_arr
2. split numbers into an array, assign it to dup_arr
3. iterate 1 to dup_arr length by idx
4.   grab dup_arr[-idx], dup_arr[-idx-1] = dup_arr[-idx], dup_arr[-idx-1] (swap last and 2nd last numbers)
5.   compare dup_arr > num_arr
6. if true 
7.   slice! numbers from dup array between (dup_arr[-idx]..dup_arr[-1])
8.   sort! them
9.   push them back to original number
10   break
10. if false iterate again
11. return num_arr joined and converted to number

```ruby
def next_bigger_num(int)
  next_num = int.digits.reverse.permutation.to_a
  next_num = next_num.map{|arr| arr.join.to_i}.sort_by{int}[1]
  next_num.nil? || next_num <= int ? -1 : next_num
end  

p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(9) == -1
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
```

