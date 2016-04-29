require 'pry'
require_relative 'player'
require_relative 'question'

puts "Welcome to the Ruby math game"
puts

puts "player 1 enter your name"
name1 = gets.chomp
player1 = Player.new(name1)

puts "player 2 enter your name"
name2 = gets.chomp
player2 = Player.new(name2)

while player1.lives >= 1 && player2.lives >= 1

  @gen_num1 = rand(1..20)
  @gen_num2 = rand(1..20)

  correct_answer = @gen_num1 + @gen_num2

  puts "#{player1.name}, your turn"
  puts "What is #{@gen_num1} plus #{@gen_num2}?"
  p1_answer = gets.chomp.to_i

  p1_answer_check = correct_answer == p1_answer


  if p1_answer_check
    player1.increase_point
    puts "Correct!"
    puts "Player 1 has #{player1.points} points"
  else
    player1.decrease_lives
    "False!"
    puts "Player 1 has #{player1.lives} lives"
  end

  puts "#{player2.name}, your turn"
  puts "What is #{@gen_num1} plus #{@gen_num2}?"
  p2_answer = gets.chomp.to_i

  p2_answer_check = correct_answer == p2_answer


  if p2_answer_check
    player2.increase_point
    puts "Correct!"
    puts "Player 2 has #{player2.points} points"
  else
    player2.decrease_lives
    "False!"
    puts "Player 2 has #{player2.lives} lives"
  end
end
if player1.lives > 0
  puts "#{player1.name} wins!"
else
  puts "#{player2.name} wins!"
end

# abstact this later



