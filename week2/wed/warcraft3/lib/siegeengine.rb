

class SiegeEngine < Unit

  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 400
    @attack_power = 50
  end

end