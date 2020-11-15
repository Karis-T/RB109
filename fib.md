=begin
Select the element out of the array if its index is a fibonacci number.
p fib_index_select([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 6]
p fib_index_select(('a'..'z').to_a) == ['b', 'c', 'd', 'f'...]

input: array of numbers
output: array of elements representing element whose INDEX is a fibonacci number

Clarifying questions:
- What is a fibonacci number?
- How do I determine the index number is fibonacci?
- multiple elements? yes

Requirements: 
- select the element if its index is fibonacci
- an array of elements will return
- new array
- the element isn't necessarily a fibonacci number - only its index from the original array
- if it is a fib num add it to a new array
-  if it isn't discard (or go next)

Mental model: Select all the elements whose index is a fibonacci number and return it as an array.

Examples: 
p fib_index_select([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 6]
is idx 0 fib? no
is idx 1 fib? yes
is idx 2 fib? yes
is idx 3 fib? yes
is idx 4 fib? no
is idx 5 fib? yes

index times [1,1] (idx) + (idx+1) 

Data Structure: 
- Array
- variable new_array which is empty to place fibonacci index numbers
- iterator to cycle through the array (each with index)
pass the index of each number into the array
- itarator to generate fibonacci numbers
- 2 method definitions:  1 will be to check if its fibonacci, the other one will select numbers that are fibonacci and return an array

Algorithm: 
1. intialize a variable new_array
2. iterate over original arraya with 2 parameters by index and by element
  - pass the index value into a method called fibonacci?
3. in the fibonacci? method we want to generate elements in an array
  - check to see if the idx is included in the fibonacci? array
  - return true or false
4. if its true
    collect it and store it in an array
    if its false
    repeat
5. return the array       

=end

```ruby
def fibonacci?(idx, arr)
  fib = [1,1]
  arr.length.times { |num| fib << fib[num] + fib[num+1] }
  fib.include?(idx)   
end  

# def fibonacci_number?(num)
#   fibonacci = [1, 1]
#   until fibonacci[-1] >= num
#     fibonacci << fibonacci[-1] + fibonacci[-2]
#   end
#   fibonacci.include?(num)
# end

def fib_index_select(arr)
  arr.select.with_index{|ele, idx| ele if fibonacci?(idx, arr)}
end


p fib_index_select([1, 2, 3, 4, 5, 6]) #== [2, 3, 4, 6]
p fib_index_select(('a'..'z').to_a) #== ['b', 'c', 'd', 'f', 'i', 'n', 'v'
```



]