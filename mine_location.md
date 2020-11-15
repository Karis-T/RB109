=begin
You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

input: 2 dimensional array
output: array representing the exact location of the mine (row and column)

Requirements:
mine is represented by the integer 1
only 1 mine in the array

Mental model: given a 2d array find the integer 1 in the array and return its 2d location

Example:
[ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] 
check [0,0] no
check [0,1] no
check [0,2] no
check [1,0] no
check [1,1] yes! return [1,1]

Data structure: array
2 iterators 1 for outer arrays 
            1 for inner arrays

Algorithm:
iterate over 2d_arr by its length (idx1)
  iterate over 2d_arr by its length (idx2)
    reference 2d_arr with idx1 and idx2 
    if its value is 1, return idx1 and idx2 in an array structure 

=end

def mineLocation(two_arr)
  two_arr.length.times do |idx1|
    two_arr.length.times do |idx2|
      return [idx1, idx2] if two_arr[idx1][idx2] == 1 
    end
  end    
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) #== [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) #== [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) #== [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) #== [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) #== [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) #== [2, 2]