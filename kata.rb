# def alphabetized(s)
#
# arr = s.chars
# alpha = ""
# letter = "a"
#
# 26.times do
#   curr_letter = arr.select {|char| char.match?(/#{letter}/i)}.join
#   letter = letter.succ
#   alpha << curr_letter
# end
# alpha
# end
#
# p alphabetized("The Holy Bible")  # "BbeehHilloTy
#
# def wave(str)
#   str = [str] * str.length
#   new_arr = []
#   str.each_with_index do |word, idx|
#     arr = word.chars
#     arr[idx].upcase!
#     new_arr << arr.join
#   end
#   new_arr
#   new_arr.select{|wrd| wrd.match?(/[A-Z]/)}
# end
#
# p wave("hello")

# def find_suspects(pockets, allowed_items)
#   return nil if pockets.values.include?(nil)
#   arr = pockets.reject do |_, array|
#     array.all? { |item| allowed_items.include?(item) }
#   end.keys
#   arr.empty? ? nil : arr
# end


# def find_suspects(pockets, allowed_items)
#   pockets.select do |_, array|
#   array.none? { |item| allowed_items.include?(item) }
# end.keys
# end
#
# pockets = {
#   bob: [1],
#   tom: [2,5],
#   jane: [7]
# }
#
# p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
# p find_suspects(pockets, [1, 7, 5, 2]) # => nil
# p find_suspects(pockets, []) # => [:bob, :tom, :jane]
# p find_suspects(pockets, [7]) # => [:bob, :tom]
#
# pockets = {}
#
# pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
# p find_suspects(pockets, [1, 3])
#

def pig_it text
  word_array = text.split.map { |word| word.chars}
  word_array.each do |word|
   if word.first.start_with?(/[a-z]/i)
    letter = word.shift
    word << letter << "ay"
   else
     word
   end
 end.map {|word| word.join}.join(" ")
end

p pig_it('Pig latin is cool')
p pig_it('I love my baby !')
