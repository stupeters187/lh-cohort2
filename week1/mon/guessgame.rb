require 'pry'
# Prompt the rules of the game
puts "Welcome to the guessing game"

#Generate a random number"
random = rand(10) + 1
binding.pry
# Ask a question
puts "Guess a number between (1 - 10)"

#get some input
input = gets.chomp

#Validate the answer

if random == input
  puts "YAY"
else
  puts "Sorry you aren't that aweomse!"
end
