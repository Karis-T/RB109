=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

create all the substrings and count how many times sub_str occurs in str
=end

```ruby
def solution(full_text, search_text)
  full_text.scan(search_text).size
end

p solution('abcdeb','b') #== 2
p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb') #== 1
```