---
title: "split strings"
tags: ""
---

=begin
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('\_').
=end

def solution(str)
  return \[] if str.empty?
  counter = 2

  (str.length/2).times do
    str.insert(counter, " ")
    counter += 3
  end

  arr = str.split

  arr[-1] &lt;&lt; "\_" if arr[-1].length.odd?
  arr
end

def solution str
  (str + "\_").scan /../
end

p solution('abc') #== ['ab', 'c_']
p solution('abcdef') #== ['ab', 'cd', 'ef']
p solution("abcdef") #== ["ab", "cd", "ef"]
p solution("abcdefg") #== ["ab", "cd", "ef", "gh"]
p solution("") #== \[]
