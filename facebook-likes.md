---
title: "facebook likes"
tags: ""
---

=begin
=begin
You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

=end

def likes(arr)

  if arr.empty?
    "no one likes this"
  elsif arr.length == 1 
     "#{arr[0]} likes this"
  elsif arr.length == 2
    "#{arr[0]} and #{arr[1]} like this"
  elsif arr.length == 3
    "#{arr[0]}, #{arr[1]} and #{arr[2]} like this"
  else
   "#{arr[0]}, #{arr[1]} and #{arr[2..-1].length} others like this"
  end

end

p likes(\[]) == "no one likes this"
p likes(["Peter"]) == "Peter likes this"
p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"
=end
