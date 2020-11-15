---
title: "1000 lights"
tags: ""
---

=begin
1000 Lights
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

input: n representing the total number of switches
output: array reprsenting which numbered lights are on

Requirements:

-   bank of switches from 1 to n
-   each switch is connected to 1 light  (hash)
-   initially all swtiches are off
    walk down the first row aand toggle all on
    go back to beggning
    2nd time toggle switches 2 4 6
    3rd pass 3 6 9
    repeat this process until all iterations are done 

Mental model: generate a series of lights from 1 to n that are all in the off position. in multiples from 1 to n begin toggling each light until all multiples of n lights are toggled. return the lights that are on

Example with n = 5 lights:

round 1: every light is turned on (multiples of 1) 1,2,3,4,5 on 0 off
round 2: lights 2 and 4 are now off; 1, 3, 5 are on (multitples of 2) turns 2 and 4 off and 1 3 5 still on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on (multiples of 3) turns 3 off 1 and 5 still on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on (mutiples of 4) turns 4 on, 1 and 5 still on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on (multiples of 5) turns off 5 1 and 4 still on

return array 1 and 4

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Data structure: 
lights = {1 => false, 2 => false etc...}

Algorithm:
problem 1: generate the light hash
    initialize empty hash (lights)
    iterate through from 1 to n (key)
      for every key in lights assign false 
      \-> returns a hash with all numbers as keys and values == false

problem 2: iterate through the hash toggling value on/off true/false
  iterate hash (keys, values)
      send key to multiple
      all the numbers that are included in multiple turn on
  iterate over lights turn on all numbers in multiples
      if lights value is false turn it to true
      if its true turn it to false

problem 3: generate multiples from 1 to n
    iterate from 1 to n (num)
        select each number even divded by key 
        reuturn those numbers and toggle each light with those numbers

=end

[2,4]

def lights_on(n)
  lights = {}
  1.upto(n) do |key|
    lights[key] = false
  end

  lights.each do |key, value|
    multiples(key, n).each do |num|
      lights[num] == false ? lights[num] = true : lights[num] = false
    end
  end

  lights.select { |key,value| key if value }.keys
end  

def multiples(num, n)
  (1..n).select { |number| number % num == 0 } 
end

p lights_on(5)
p lights_on(10)
