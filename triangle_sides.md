A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.


Understanding the problem:

input: 3 integers representing 3 sides of a triangle
output: returns a SYMBOL representing either :equilateral, :isocleles, :scalene or :invalid depending on what it is

clarifying questions: 
How do we verify all 3 sides are equal for equilateral?
How do we verify 2 sides are equal and 1 is not for isocleles?
How do we verify all 3 sides are different for scalene?
How do we verify 2 shorter sides are greater than longest side?
How do we verify all lengths are greater than 0?    

Requirements:
valid triangle = the sum of the 2 shortest sides is > than the longest side
AND all lengths must be greater than 0 

1. equilateral = all 3 sides are the same
2. isocleles = 2 sides are the same, 1 is different
3. scalene = all sides are different

Mental Model: Given 3 sides of a triangle return :equilateral if all 3 sides hold the same value, :isocleles if 2 sides are equal and 1 is not, and :scalene if all sides are unequal. A triangle is only valid if the sum of the 2 shortest sides is greater than the longest, AND they're all greater than 0

Examples:
triangle(3, 3, 3) == :equilateral 
find the max value = 3
is the two values sum greater than the largest and bigger than 0? true
do all sides equal each other? yes (idx 0 == idx 1) and (idx1 == idx3) ? 
return equilateral

triangle(3, 4, 5) == :scalene
find the max value = 5
is the two values greater than the larget and bigger than 0? true
do all the sides equal each other? false
do all the sides not equal each other? true
return scalene

Data structure: 
arrays - is easy to find the max value
side1 side2 side3 variables 

```ruby
def triangle(side1, side2, side3)
  tri = [side1, side2, side3].sort!
  return :invalid if tri[0] + tri[1] <= tri[2] || tri.any?{|side| side <= 0}
  if tri.uniq.length == 1
    :equilateral
  elsif tri.uniq.length == 2
    :isocleles
  else
    :scalene
  end
end  

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
```

```ruby
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.sum != 180 || angles.any?{|num| num <= 0}

  if angles.all?{|num| num < 90}
    :acute
  elsif angles.one?{|num| num == 90}
    :right
  else
    :obtuse
  end
end



p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid
```

