=begin
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

=end

```ruby
def expanded_form(int)
  int = int.to_s
  new_arr = []
  int.length.times do
    num = int.slice!(0)
    next if num == "0"
    new_arr << "#{num}#{"0" * int.length}"
  end
  new_arr.join(" + ")
end

p expanded_form(12) #== '10 + 2'
p expanded_form(42) #== '40 + 2'
p expanded_form(70304) #== '70000 + 300 + 4'
```