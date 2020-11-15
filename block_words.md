A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

intput: string word 
output: boolean true or false

requirements: 
spelling block has 2 letters per block
each block can only be used once
return true if word can be spelled out by only using these blocks once
otherwise false

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

```ruby
BLOCK_LETTERS = {"B"=>"O", "X"=>"K", "D"=>"Q", "C"=>"P", "N"=>"A", "G"=>"T", "R"=>"E", "F"=>"S", "J"=>"W", "H"=>"U", "V"=>"I", "L"=>"Y", "Z"=>"M"}

def block_word?(str)
  BLOCK_LETTERS.none? {|k, v| str.upcase.match?(k) && str.upcase.match?(v) }
end 

p block_word?('BATCH')
p block_word?('BUTCH')
p block_word?('jest')
```