---
title: "reverse and combine words"
tags: ""
---

=begin
Your task is to Reverse and Combine Words.

1.  More than one word? Reverse each word and combine first with second, third with fourth and so on...
    (odd number of words => last one stays alone, but has to be reversed too)
2.  Start it again until there's only one word without spaces
3.  Return your result…

reverse and combine words

Input: String containing different "words" separated by spaces

pick up two words
reverse and join them

gffds432243fdsfdseewttf

sdfsdf wee sdffg 342234 ftt
gffds 432243 fdsfds eew ttf

sdfsdf wee [0,2]
eew fdsfds
fdsfdseew

sdffg 342234 [1,2]
gffds 432243
gffds432243

ttf [2,2]
ftt

Algoritthm:

-   split words into word array
-   until word array length is 1
-   iterate over word array (word)
       reverse each word
-   slice each word array into pairs
-   iterate over each pair (pair)
       join each pair of words together
-   join final words together

=end

def reverse_and_combine_text(str)
  wrd_arr = str.split
  until wrd_arr.length == 1
    wrd_arr = wrd_arr.map(&:reverse).each_slice(2).map(&:join)
  end
  wrd_arr.join
end  

p reverse_and_combine_text("abc def") #== "cbafed"
p reverse_and_combine_text("abc def ghi jkl") #== "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") #== "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") #== "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") #== "gffds432243fdsfdseewttf"
