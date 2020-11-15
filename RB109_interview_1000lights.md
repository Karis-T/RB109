You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

### Understanding the problem

input: an integer n == the total number of switches
output: returns an array that shows which lights were left on

Requirements
- all lights are set to off
- a bank of switches from 1 to n
-each switch is connected to one light
- 1st pass toggle all of them "on"
-second pass toggle all multiples of 2
-3rd pass toggle all multiples of 3
- repeat this process of toggling multiples in acending order until you have been thorugh n iterations 

problem domains: n/a

Clarifying Questions
- what is a light?
- what is a switch?

Mental Model
you have a set of lights from 1 to n that are set in the "off" position. From the starting position of 1 Toggle them in multiples of 1, 2 and so forth until you've gone through all the numbers from 1 to n. 

### Example 
with n = 5 lights:

round 1: every light is turned on 1/1, 2/1, 3/1 4/1 5/1 (1 is the denominator), all lights are turned on 
round 2: lights 2 and 4 are now off; 1, 3, 5 are on 1/2, 2/2, 3/2, 4/2 5/2 must have no remanders 4/2 == 0 
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on 1/3, 2/3, 3/3, 4/3, 5/3 , 3 was the only 1 turned off
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on 1/4, 2/4 3/4 4/4 5/4, 4 was the only one turned on 
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on 1/5, 2/5, 3/5, 4/5, 5/5, 5 was the only 1 turned off
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9]

### Data representation
Hashes would be great to set in the on/off position,  or even boolean true/false
switch1 => light on/off
light switches {1 => false, 2 => false, 3=>false, 4=> false, 5=> false} 
repeat over each key swtching them on and off in multiples
modfy the value if multple is true

### Algorithm
create a hash from 1 to n with all its keys being (1..n)
and all its values set to false
create an array from 1 to n
iterate over each number
for each number in n select the multples of n
once mutples selected then set/update these values in the hash this time round
repeat until all numbers in the hash have been iterated over
select and return the values from the hash that are "true"

```ruby
def lights_left_on(n)
  #create a hash from 1 to n with all values set to false
  total_lights = {}
  (1..n).each { |num| total_lights[num] = false }
  #iterate over each number
  (1..n).each do |denominator|
  #for each num in n select the multiples of the number
   	multiples = (1..n).to_a.select {|numerator| numerator%denominator == 0 }
  #once multples selected set update these values in the hash this time round
  	multiples.each {|num| total_lights[num] == false ? total_lights[num] = true : total_lights[num] = false}
  end
 #once repeated return all values from hash that are true
  total_lights.select{|k, v| v}.keys    
end

p lights_left_on(1000)
```
