Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

Algorithm
iterate over each letter
if current letter matches letter upcased
append a dash and lowercase it and push it into the new string
if current letter matches any lower case letter of alphabet
keep pushing it into new string

```ruby
def kebabize(str)
  new_str = ""
  str.each_char do |char|
    new_str << "-#{char.downcase}" if char.match?(/[A-Z]/)
    new_str << char if char.match?(/[a-z]/)
  end
  new_str[0] == "-" ? new_str[1..-1] : new_str 
end  

p kebabize('myCamelCasedString') #== 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
p kebabize('PPppKkkk')
p kebabize('1LlllKkkk')
p kebabize('444HhhhJjjj')
p kebabize('55jJ5Jjj')
```