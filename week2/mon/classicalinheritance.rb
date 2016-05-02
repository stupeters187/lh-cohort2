module Flight

  def fly
   puts "I can fly!"
  end

end

class Animal

  attr_reader :alive, :can_fly

  def initialize
    @alive = true
    @can_fly = false
  end

end

class Mammal < Animal

  attr_accessor :num_legs

  def initialize(num_legs)
    @num_legs = num_legs
  end

  def quadruped?
   @num_legs == 4 ? true : false
  end

end

class Amphibian < Animal

  attr_accessor :makes_noise, :colour

  def initialize(makes_noise, colour)
    @makes_noise = makes_noise
    @colour = colour
  end

  def disruptive?
    @makes_noise == true ? true : false
  end

end

class Primate < Animal

  attr_accessor :walks_upright, :fav_food

  def initialize(walks_upright, fav_food)
    @walks_upright = walks_upright
    @fav_food = fav_food
  end

  def quadruped?
    @walks_upright == true ? false : true
  end

end

class Bird < Animal

  include flight

  attr_accessor :is_colourful, :fav_food

  def initialize(is_colourful, fav_food)
    @is_colourful = is_colourful
    @fav_food = fav_food
  end

  def easy_to_see?
    @is_colourful == true ? true : false

  end

end

class Frog < Amphibian

  def initialize
    super(true, 'green')
    @can_fly = false
  end

end

class Bat < Mammal

  include flight

  def initialize
    super(2)
    @can_fly = true
  end

end

class Parrot < Bird

  def initialize
    super(true, 'crackers')
    @can_fly = true
  end

end

class Chimpanzee < Primate

  def initialize
    super(true, 'bananas')
    @can_fly = false
  end

end


