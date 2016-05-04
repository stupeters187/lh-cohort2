

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
    if enemy_unit.dead? == true
      false
    else
      enemy_unit.damage(@attack_points)
    end
  end

  def dead?
    if health_points <= 0
      true
    else
      false
    end
  end

end