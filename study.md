```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

We first define the method `fix` that spans lines 1-5, and takes a single parameter `value`

Then on line 7 we initialize the variable a and assign it to the string `'hello'` . On line 8 we invoke the `fix` method and pass in the object that `s` is pointing to - `'hello'` as an argument. It's at this point parameter `value` is assigned to the string `hello` and makes it available to the method body as a local variable.

Within the method definition on line 2 we invoke the `upcase!` method on the object that `value` is pointing to. `upcase!` is a destructive method that permanently mutates the original object so it returns `'HELLO'` . Then on line 3 we invoke the `concat` method on object `'HELLO'` again, this time passing a `! ` as an argument. `concat` is also a destructive method that permanently mutates the object that invoked the method in this case it'll read `'HELLO!'` Since we were pointing to the original object that was first passed in this whole time and mutating it along the way, the method implicitly returns the last evaluated line `value` and stores it in the local variable `t` on line 8. If we reference t and s they'll both return `'HELLO!'` . 

This example demonstrates the mutability of string objects and that if the object is still being referenced by the method definition parameter and invoking destructive methods on it - it'll permanently mutate the original object. 

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

On line 1-5 we define a method `fix` that takes a single parameter `value`. Then on line 7 we initialize the local variable `s` and assign it to the string `hello`. On line 8 we invoke the `fix` method and pass in the object that variable s is referencing as an argument. It's at this point the parameter `value` is assigned to `'hello'` and makes it available to the method body as a local variable. On line 2 we invoke the `<<` method on `value` and pass in the string `'xyz'` as an argument. `<<` permanently appends the argument onto the object that `value` is referencing, which mutates it and returns `'helloxyz'` . From line 3 onwards value will reference a new object thanks to `value = value.upcase` which is assignment of a new object to value. This means lines 2 and 3 return values will be stored in local variable `t` on line 8, which when referenced will return `'HELLOXYZ!'`. On the other hand variable `s` thanks to reassignment, will only return the first modification from the method - which is `'helloxyz'`. 

This example demonstrates ruby's unique pass by reference value when it comes to method definitions. Compared to other languages, ruby takes only a copy of the reference of the object passed in as an argument to the invocation. What this means is as long as its being referenced it can be modified destructively. However the moment it's reassigned, it cannot modify the original object and must be stored back into a variable again to use the changes.

```ruby
num = 3

num = 2 * num
```

On line 1 we initialize the local variable `num` and assign it to the integer `3`. Then on line `3` since numbers are immutable, in order for `num` to reference a change it has to be reassigned back to a variable. We invoke the `*` method on integer `2` pass in the object that `num` is pointing to as an argument. This returns `6` and it is stored back into the variable `num`. This example demonstrates the immutability of numbers and its methods, and how they must be consistently stored in variables after method invocations in order to use the new return value. 

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

On line 1 we initialize the variable a and assign it to `w%(a b c)` which returns the array of strings `["a", "b", "c"]` .  Then on line 2, while it `a[1] = '-'` appears to be assignment or reassignment its actually a setter method in play that permanently updates an element the object that a is pointing to. In this case the element located at index `1` is modified to `-` so when we invoke the `p` method and pass variable `a`  as an argument it outputs and returns ["a", "-", "c"]. this example demonstrates that even if `=` is present, its not necessarily assignment and that setter methods permanently modify collection items.

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

on line 1 we define the method add_name that spans lines 1-3 and takes 2 parameters `arr, name`.On line 5 we initialize the local variable names and assign it to the array `['bob', 'kim'] `. Then on line 6 we invoke the `add_name` method , passing in the object that `names` is pointing to, followed by the string `jim`. These objects are assigned to parameters `arr, name` respectively. On line 2 within the method however `arr = arr + [name]` is reassignment which means that `arr` is no longer referencing the object that was originally passed in. This means no changes were made to `['bob', 'kim']` and this is what is output. 

This example demonstrates ruby's unique pass by reference value when it comes to method definitions in that it passes a copy of a reference to the object, rather than the object itself. This means non-mutating methods like `+` do not modify the original object.



```ruby
[[2, 4], [6, 8]].map do |arr|
  arr.map do |num|
    num + 3
  end
end
```

On line 1 we invoke the `map` method on the multidimensional array `[[2,4], [6,8]]`passing in a `do..end` block that spans lines 1-5 and takes 1 parameter `arr` . `arr` represents the current sub-array being iterated over and in order to access each element within each array we invoke the `map` method a second time on `arr` passing in a `do..end` block that spans lines 2-4 taking 1 parameter `num`. 

The `map` method returns a new array based on the the block's final return value and uses that value as transformation criteria for each element in the array. In this case on line 3 the `+` method is invoked on each element within each sub-array `num` passing in the integer `3` as an argument. The inner block is executed 4 times for each element within the sub array and the outer block is executed 2 times for each sub-array returning a new multidimensional array `[[5, 7], [9, 11]]`. Each element is increased by 3 as per the transformation criteria within the inner block.   

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```

On line 1 we initialize the local variable `array `and assign it to the Array object `[1,2,3,4,5]`. Then on line 3 we invoke the `select` method on `array` passing `do..end` block as an argument , spanning lines 3-5 with a single parameter `num`. The `select` method returns a new array based on the blocks return value. If the block return value evaluates to false then the element is not selected. The blocks return value is predicated on the last evaluated line within the block. In this case `puts num if num.odd?` evaluates to `false` so nothing is selected and an empty array is returned `[]` . While `puts` outputs `1`,`3` and `5` it always returns `nil`. In terms of evaluation `nil` evaluates to false.

```ruby
 arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
 n + 1
end
p new_array
```

On line 1 we initialize the local variable `arr` and assign it to the array `[1,2,3,4,5,6,7,8,9,10]`. Then on line 3 we invoke the `Array#select` method on `arr` and pass a `do..end` block as an argument spanning lines 3-6, which takes a single parameter `n`. The `select` method returns a new array based on the block's return value. If blocks return value evaluates to `true`, then the element is selected. In this case `n + 1` will return an integer, evaluating to `true` because every expression in ruby evaluates to `true` except for `false` and `nil`. This means all elements will be selected and placed in a new array and stored within the local variable `new_array`. So when we invoke the `p` method on line 6 and pass in `new_array` as an argument it'll output and return the array `[1,2,3,4,5,6,7,8,9,10]`

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
 n + 1
 puts n
end
p new_array
```

On line 1 we initialize the local variable `arr` and assign it to the array `[1,2,3,4,5,6,7,8,9,10]` . Then on line 3 we invoke the `Array#select` and pass on `arr` , passing in a `do..end` block as an argument that spans lines 3-6 and takes a single parameter `n`. The `select` method returns a new array based on the blocks return value. If the blocks return value evaluates to false none of the items are selected. The blocks return value is predicated on the last evaluated line, in this case it's `puts n`. `puts` always returns `nil` which evaluates to `false` so therefore, none of the items are` selected` and an empty array `[]`is stored into `new_array` and then output to the screen on line 7 and returned. the `puts n` on line 5 does output all the array elements to the screen but they have not been modified by the expression on line 4, so `1 2 3 4 5 6 7 8 9 10` is output.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
```

On line 1 we initialize the local variable `arr` and assign it to the array `[1,2,3,4,5,6,7,8,9,10]`. Then on line 3 we invoke the `Array#map` method on `arr` passing a `do..end` block as an argument spanning lines 3-6 and takes a single parameter `n`. The  `map` method returns a new array based on the blocks return value. The blocks return value is used as transformation criteria for each element in the array. The blocks return value is predicated on its last evaluated line  - `puts n` which returns `nil`. This means the array that's stored in variable new_array on line 3 and output on line 7 will be `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` This example demonstrates the `map` methods capabilities and intentions, which is only to transform elements and is not suitable for anything else. This is why we have to be very careful of the expressions used in the block as it might lead to unexpected results.

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

On line 1 we initialize the local variable a and assign it to the string `"hello"`. 

Then on line 3 we invoke the `Array#map` method on the object `[1,2,3]` and pass in a `{}` block as an argument with a single parameter `num` . This parameter isn't used however as we instead reference the string `"hello"` using local variable `a` within the block. 

The `Array#map` method returns a new array dependent upon the blocks return value. The blocks return value is used as transformation criteria for each element within the array and it is based on the last evaluated expression. In this case `"hello"` is used as the transformation criteria for each element in the array therefore `["hello", "hello", "hello"]` is returned from the method invocation. 

This example demonstrates the `map` methods transformational capabilities and how the block's return value affects each element in the array.  

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
 word.start_with?("t")
end

p new_array
```

On line 1 we initialize the local variable `words` and assign it to the array `["jump", "trip", "laugh", "run", "talk"]`. just a note here `%w` converts each argument in parentheses to a string contained in an array. 

Then on line 3 we invoke the `Array#map` method on the `words`, passing in a `do..end` block as an argument, spanning lines 3- 5 and takes a single parameter `word`. 

The `Array#map` method returns a new array based on the return value of the block, which is the last evaluated expression. This expression is used as the transformation criteria that changes element within the array. In this case the expression `word.start_with?("t")` will always return a Boolean value, `true` or `false` . This means the `map` will return the array `[false, true, false, true, false]`, storing it in the local variable `new_array` on line 3 and outputting it on line 7 via the `Kernel#p` method.

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

On line 1 we invoke the `Array#each` method passing in a `do..end` block as an argument that spans lines 1 to 3 and takes a single parameter `num` . `num` represents the current iterated element within the block so when we invoke the `Kernel#puts` method and pass in `num` as an argument, it outputs `1` `2` `3` . 

Unlike other methods, The `Array#each` method discards its block return value and simply returns the same object that invoked the method in this case `[1,2,3]`. This example demonstrates the power of the `each` method and its primary purpose is for iteration of each element within a collection.

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

On line 1 we initialize the local variable `a` and assign it to the string `"Hello"`. Then on lines 3-7 we have a conditional `if` statement that has the condition `a`. In ruby every expression/object evaluates to `true` except for `false` and `nil`. So in this case `a` evaluates to `true` because `a` is pointing to an object `"string"` that doesn't evaluate to `false` or `nil`. This means the statement on line 4 `puts "Hello is truthy"` will always be executed. 

```ruby
def test
 puts "written assessment"
end
var = test

if var
 puts "written assessment"
else
 puts "interview"
end
```

On line 1 we define the method `test` that spans lines 1 to 3 . Then on line 4 we initialize a local variable var and assign it to the return value of the method `test`, which in this case `puts "written assessment"` evaluates to `nil`. 

On line 6-10 we have a conditional if statement with the condition of `var`. In ruby every object/expression evaluates to `true` except for `false` and `nil`. Since the local variable `var` references `nil` the `else` statement will always be executed outputting the code `"interview"` on line 9 via the `puts` method. This example demonstrates the caution to be exercised when considering the return value of methods and also how objects can evaluate to true or false in ruby.

```ruby
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```

On line 1 we invoke the Array#sort method on the array object `['arc', 'bat', 'cape', 'ants', 'cap']` with no block. `sort` puts string objects in order based on their ASCII table position. it takes each word and compares it to another word character by character. `sort` uses the `<=>` method which returns a 1, -1 or 0 if the character on the left is greater than, less than or equal to the character on the right respectively. In this case `sort` returns the new array `['ants', 'arc', 'bat', 'cap', 'cape']`. `cape` is greater than `cap` because it has more letters. This example demonstrates the sort methods comparison technique for strings using ASCII table positioning. 

```ruby
['kitty', 'yarn', 'mat'].sort_by do |word|
  word.length
end
```

On line 1 we invoke the `Enumerable#sort_by` method on the array `['kitty, 'yarn', 'mat']` and pass in a block as an argument, spanning lines 1-3 and takes a single parameter `word` . When we invoke `.length` on `word` it will sort each element according to string size,  this returns `['mat', 'yarn', 'kitty']`. This example demonstrates how`sort_by` uses its criteria in the block to perform an order to the elements in a given collection.

Sorting is carried out by comparing the items in a collection with each other and ordering them based on the result of that comparison. It uses the `<=>` operator to compare items and is only concerned about `<=>` return value (-1, 0 -1 or nil)

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
=> false"		
```

On line 1 we invoke the `any?` method on the hash `{ a: "ant", b: "bear", c: "cat" }` passing a `do..end` block as an argument that spans lines 1-3 and takes two parameters `key`  and `value`. `key` represents all the symbol keys and `value` represents all the string values. The method `any?` will check to see if any of the keys or values in the hash comply with the logic in the block. In this case we invoke the `size` method on `value` which will return the string size of each value. We then invoke the `>` greater than method on this return value, passing in a `4` as an argument which checks to see if there's any string sizes greater than 4. This method will return a boolean value`false` as there are no string values greater than `4` in this hash.

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

On line 1 we invoke the `Enumerable#all?` method on the array `[1,2,3]` , passing a `do..end` block as an argument, spanning lines 1-3 and takes a single parameter `num`. The `all?` method checks to see if all the elements in the collection comply with the logic within the block, and returns `true` if they are. In this case we invoke the method `>` greater than on `num` , which represents the current iterated object and pass the argument `2` . Here we are checking if all elements in the array are greater than 2, which not all are therefore the method will return `false`.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

On line 1 we initialize the local variable `greeting` in the outer scope and assign it to the string `'Hello'`.  Then on line 3 we invoke the `loop` method and pass to  it a `do..end`,which defines a block as an argument that spans lines 3-6 and creates an inner scope. Within the block on line 4 we reassign the local variable `greeting` to the string `'Hi'` . Outside the block on line 8 we invoke the `puts` method and pass local variable `greeting` as an argument which outputs `'Hi'` to the screen and returns `nil`. 

This example demonstrates local variable scoping rules in that local variables initialized in the outer scope can be accessed and changed from within the inner scope of the block. This change affects the variable in the outer scope which is why `'Hi'` is output instead of `'Hello'` on line 8. 

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

On line 1 in the outer scope we initialize the local variable `a` and assign it to the integer `4`. On line 2 we initialize the local variable `b` and assign it to the integer `2` . Then on line 3 we invoke the `loop` method that takes and defines a `do..end` block as an argument, spanning lines 4-8 creating an inner scope. From within the block on line 5 we initialize the local variable `c` and assign it to the integer `3` . Then on line 6 we reassign local variable `a` to the object that `c` is referencing, in this case `3`. Both variables are now pointing to the same object. 

On lines 10 and 11 we invoke the `puts` method on local variables `a` and `b` respectively. `a` will output `3` and `b` will output `2` both returning nil. 

This example demonstrates local variable scoping rules in that variables initialized in the outer scope can be accessed and changed from within an inner scope and have that change affect it in the outer scope. This is why `a` outputs `3` instead of `4`. On the other hand this also demonstrates that variables point to objects/physical space in memory and aren't inextricably linked to each other. Although `c` was initialized inside the block and cannot be referenced from the outside, `a` can still be assigned to the object that `c` is pointing to and safely reference it in the outer scope.

