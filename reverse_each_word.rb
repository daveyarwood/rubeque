 # Write a method that takes a sentence and returns it with each word reversed in place. 
 
def reverse_each_word(sentence)
  sentence.split(' ').map(&:reverse).join(' ')
end

# tests
assert_equal "olleH ,ereht dna woh era ?uoy", reverse_each_word("Hello there, and how are you?")
