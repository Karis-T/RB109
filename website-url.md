---
title: "website url"
tags: ""
---

=begin
5 kyu
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("<http://github.com/carbonfive/raygun">) == "github" 
domain_name("<http://www.zombie-bites.com">) == "zombie-bites"
domain_name("<https://www.cnet.com">) == "cnet"

split by : / . and https and http and www
delete empty spaces
get the first in array

=end

def domain_name(str)
  str = str.split(/[^\w-]|https|http|www/)
  str.delete("")
  str[0]
end  

p domain_name("<http://google.com">) #== "google"
p domain_name("<http://google.co.jp">) #== "google"
p domain_name("[www.xakep.ru"](http://www.xakep.ru")) #== "xakep"
p domain_name("<https://youtube.com">) #== "youtube"
p domain_name("<http://github.com/carbonfive/raygun">) #== "github" 
p domain_name("<http://www.zombie-bites.com">) #== "zombie-bites"
p domain_name("<https://www.cnet.com">) #== "cnet"
