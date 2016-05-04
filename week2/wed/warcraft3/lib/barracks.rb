class Barracks

  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
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

  def train_siege_engine
    @gold -= 200
    @food -= 3
    @lumber -= 60
    siege = SiegeEngine.new
  end

  def damage(amount)
    @health_points -= amount
  end
end
