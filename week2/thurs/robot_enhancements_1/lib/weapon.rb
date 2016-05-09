class Weapon < Item

  attr_reader :damage

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end

  def hit(robot)
    robot.wound(45)
  end

end