```ruby
def scramble(s1,s2)
  s2.chars.all?{|letter| s1.match?(letter) && s1.count(letter) >= s2.count(letter)}
end
```

