---
title: "greatest product"
tags: ""
---

=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

=end

def greatest_product(str)
  sub_str = \[]
  (str.length - 4).times do |idx| 
  	sub_str &lt;&lt; str[idx, 5]
  end
  sub_str.map{ |str| str.chars.map(&:to_i).reduce(:\*) }.max
end 

p greatest_product("123834539327238239583") #== 3240
p greatest_product("395831238345393272382") #== 3240
p greatest_product("92494737828244222221111111532909999") #== 5292
p greatest_product("02494037820244202221011110532909999") #== 0
