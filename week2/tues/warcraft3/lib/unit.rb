

class Unit

  attr_reader :health_points
  
  def initialize(hp, ap)
    @health_points = hp
    @attack_points = ap
  end

  def damage(amount)
    @health_points -= amount
  end

  def attack!(enemy_unit)
    enemy_unit.damage(@attack_points)
  end

end