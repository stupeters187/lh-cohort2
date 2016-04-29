require 'pry'

class Player

  attr_accessor :name, :points, :lives

  def initialize(name)
    @name = name
    @lives = 3
    @points = 0
  end

  def increase_point
    @points += 1
  end

  def decrease_lives
    @lives -= 1
  end

  def to_s
    @name
  end
end