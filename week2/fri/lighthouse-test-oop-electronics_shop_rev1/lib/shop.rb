class Shop

  attr_reader :name, :inventory, :sales

  def initialize(name)
    @name = name
    @inventory = []
    @sales = []
  end

  def add_to_inventory(item)
    @inventory << item
  end

  def sell_item(item)
    return false unless @inventory.include?(item)
    @sales << item
    @inventory.delete(item)
    item
  end

  def revenue
    
  end
end