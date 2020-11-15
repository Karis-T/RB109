---
title: "do not use squeeze"
tags: ""
---

=begin
def crunch(str)
  crunch_str = ""
  str.chars.each_with_index do |char, idx|
    next if str[idx+1] == char
    crunch_str &lt;&lt; char
  end
  crunch_str
end
=end

def crunch(str)
  str.chars.slice_when{ |a, b| a != b }.map(&:uniq).join
end  

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''
