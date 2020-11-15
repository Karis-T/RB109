```ruby
def solve(str)
  str.split(/[^aeiou]/).max_by{|sub| sub.length}.length
end
```

```ruby
str.scan(/[aeiou]+/).max_by{|sub_str| sub_str.length}.length
```

