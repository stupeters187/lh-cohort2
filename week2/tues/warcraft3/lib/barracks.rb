class Barracks

  attr_reader :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      footman = Footman.new
    else
      nil
    end
  end

  def can_train_footman?
     gold >= 135 && food >= 2 
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      peasant = Peasant.new
    else
      nil
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end
end
