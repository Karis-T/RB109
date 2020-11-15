---
title: "The simpsons"
tags: ""
---

=begin
Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

array of hashes
=end

def list(arr)
  return "" if arr.empty?
  name_arr = arr.map { |word| word[:name] }
  if name_arr.length == 1
    name_arr[0]
  elsif name_arr.length == 2
    name_arr.join(" & ")
  else
    name_arr[0..-3].map{|name| name &lt;&lt; ","}
    name_arr.insert(-2, "&").join(" ")
  end
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}, {name: 'Marge'}, {name: 'Homer'} ])

# returns 'Bart, Lisa & Maggie'

p list([ {name: 'Bart'}, {name: 'Lisa'} ])

# returns 'Bart & Lisa'

p list([ {name: 'Bart'} ])

# returns 'Bart'

p list(\[])

# returns ''
