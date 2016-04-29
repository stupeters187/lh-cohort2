require 'pry'
require_relative 'player'

class Game

  def initialize
    puts "Welcome to the Ruby math game"

    puts "player 1 enter your name"
    name1 = gets.chomp
    @player1 = Player.new(name1)

    puts "player 2 enter your name"
    name2 = gets.chomp
    @player2 = Player.new(name2)
  end

  def generate_question(player)
    @gen_num1 = rand(1..20)
    @gen_num2 = rand(1..20)

    @correct_answer = @gen_num1 + @gen_num2
  end

  def player_answer(player)
    @correct_answer = @gen_num1 + @gen_num2
    puts "#{player.name}, your turn"
    puts "What is #{@gen_num1} plus #{@gen_num2}?"
    @answer = gets.chomp.to_i

    @answer_check = @correct_answer == @answer
  end

  def handle_answer(player)
    @answer_check = (@correct_answer == @answer)

    if @answer_check
      player.increase_point
      puts "Correct!"
      puts "#{player.name} has #{player.points} points"
    else
      player.decrease_lives
      puts "False!"
      puts "#{player.name} has #{player.lives} lives"
    end
  end

  def game_session
    while @player1.lives > 0 && @player2.lives > 0
      game(@player1) 
      break if @player1.lives == 0
      game(@player2) 
    end
    declare_winner
  end  

  def game(player)
    generate_question(player)
    player_answer(player)
    handle_answer(player)
  end

  def declare_winner
    player = @player1.lives > 0 ? @player1 : @player2
    puts "The winner is #{player}"
  end
end

