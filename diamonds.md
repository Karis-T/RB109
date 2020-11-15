=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Understanding the problem: 

Input: an odd integer
Output: a n x n, 4 pointed diamond printed to the screen

Clarifying questions:
- how do we center the diamond points?
- How much space do we need before the stars?
- How do we caluculate stars per row "*" ?
- How do we calculate space " " per row?      

Requirements:
- 4 pointed diamond
- n x n grid
- n must be an odd integer
- n is the argument to the method

implicit requirements:
- stars are counting up by 2
- spaces are counting down by 1 (from n/2)
- when we hit the center 0 spaces and n number of stars
- stars count down by 2
- spaces count up by 1 (from 0)  

Mental Model:
given a number n, print out a n x n, 4 pointed diamond made up of stars "*" and spaces " ". The longest part of the diamond is equal to the widest part of the diamond. this represents the number n.

Examples:

```ruby
diamond(1)
*
diamond(3)
 *
***
 *
 diamond(9)
	*     4 spaces, 1 star  stars == n-2-2-2-2
   ***    3 spaces, 3 stars stars == n-2-2-2
  *****   2 spaces, 5 stars stars == n-2-2
 *******  1 space, 7 stars  stars == n-2 
********* 0 spaces, 9 stars stars == n
 *******  1 space, 7 stars
  *****   2 spaces, 5 stars
   ***    3 spaces, 3 stars
    *     4 spaces, 1 star
```

Data Stucture: 
iterators and strings
2 counters one for stars and one for the spaces called star_counter, space_counter
variable for "*" called star
variable for " " called space
half of n is the space_counter eg. space_counter = n/2 == 4

Algorithim:
0. intialize half = n/2 and intialize star_counter = 1
1. count down from half to 1
    print (space * space_counter) + (star * star counter)
    for every iteration star_counter += 2
    end count up   
2. print n number of stars
3. count up from 1 to half
    print (space * space_counter) + (star * star_counter)
    for every iteration star_counter -= 2
    end count down  

```ruby
def diamond(n)
  half = n/2
  star_counter = 1
  half.downto(1) do |space_counter|
    puts "#{" " * space_counter}#{"*" * star_counter}"
    star_counter += 2
  end
  puts ("*" * n)
  star_counter = n-2
  1.upto(half) do |space_counter|
  puts "#{" " * space_counter}#{"*" * star_counter}"
  star_counter -= 2
  end
end
diamond(21)
```