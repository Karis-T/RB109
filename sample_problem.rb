# PROBLEM:
#
# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.
#
# input: a string sentence casing
# output: Same string with palindromes words uppercased
#
#
# FUNCTION palindrome?(current_word)
#   current_word == REVERSE current_word
# END FUNCTION
#
# CONVERT string to array_of_words
#
# changed_array = ITERATE array_of_words by current_word
#                   IF palindrome?(current_word)
#                     uppercase current_word
#                   ELSE
#                     current_word
#                   END IF
#                 END ITERATE
#
# CONVERT changed_array to string


def palindrome?(word)
  word == word.reverse
end

def change_me(string)
  array = string.split
  changed_array = array.map do |current_word|
                    if palindrome?(current_word)
                      current_word.upcase
                    else
                      current_word
                    end
                  end
  changed_array.join(" ")
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"