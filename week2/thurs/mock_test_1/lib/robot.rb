class Robot

  CAPACITY = 250

  attr_reader :x, :y, :items, :equipped_weapon
  attr_accessor :health, :equipped_weapon
  

  def initialize
    @health = 100
    @x = 0
    @y = 0
    @items = []
    @equipped_weapon = nil
  end

  def position
    [@x, @y]
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

  def pick_up(item)
    if item.is_a?(Weapon)
      @equipped_weapon = item
    elsif items_weight < 250
      @items << item
    end
  end

  def wound(amount)
    if (@health - amount) >= 0
      @health -= amount
    else
      @health = 0
    end
  end

  def heal(amount)
    if (@health + amount) <= 100
      @health += amount
    end
  end

  def attack(enemy)
    if !equipped_weapon.nil?
      equipped_weapon.hit(enemy)
    else
      enemy.wound(5)
    end
  end

  def items_weight
    return 0 if @items == []
    total_items = 0
    @items.each {|item| total_items += item.weight }
    total_items
  end

  def capacity


  end


end
