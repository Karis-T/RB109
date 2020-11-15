=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

def scramble_words(words)

words.split(' ').map { |word| scramble(word) }.join(' ')

end

def scramble(word)

chars = word.chars

letters = chars.select { |char| letter?(char) }

scrambled_letters = scramble_letters(letters.join).chars

chars.map do |char|

letter?(char) ? scrambled_letters.shift : char

end.join

end

def scramble_letters(word)

return word if word.length <= 2  

word[0] + word[1...-1].chars.sort.join + word[-1]

end

def letter?(char)

char.match? /[a-z]/

end

def scramble_words(str)
  return str if str.length < 4
  str.split.map do |word|
    if word.match?(/[^\w]/)
      char = word.slice(/[^\w]/) 
      idx = word.index(char)
      word.delete!(char)
    end
    sub_str = word.slice(1..-2).chars.sort.join
    scramble = word[0] + sub_str + word[-1]
    scramble.insert(idx, char) if char
    scramble
  end.join(" ")
end  

Algortihm:
split string into word_array 
iterate over word_array (word)
  go to next iteration if the word length is less than or equal to 3
  split word into an array of chars
  select all the chars that are lowercase a-z and return it to variable letters
  sort second to last letters and convert to string.
  concatenate letter[first] and letter[last] to letters
  split all these letters into array characters and assign it to varaible scrambled_letters
  iterate over chars (char)
    if char matches lowercase a-z
      remove the first letter from scambled_letters
    otherwise
      char
  then join all the chars together  
then join the whole string together

```ruby
def scramble_words(words)
  words.split(' ').map do |word|
    next word if word.length <= 3
    chars = word.chars
    letters = chars.select { |char| char.match?(/[a-z]/) }
    scrambled_letters = (letters[0] + letters[1...-1].sort.join + letters[-1]).chars
    chars.map { |char| char.match?(/[a-z]/) ? scrambled_letters.shift : char }.join
  end.join(' ')
end

p scramble_words('professionals') #== 'paefilnoorsss'
p scramble_words('i') #== 'i'
p scramble_words('') #== ''
p scramble_words('me') #== 'me'
p scramble_words('you') #== 'you'
p scramble_words('card-carrying') #== 'caac-dinrrryg'
p scramble_words("shan't") #== "sahn't"
p scramble_words('-dcba') #== '-dbca'
p scramble_words('dcba.') #== 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") #== "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
```