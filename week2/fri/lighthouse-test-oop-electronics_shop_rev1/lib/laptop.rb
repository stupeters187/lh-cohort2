class Laptop < Product

  attr_reader :model, :ram, :size, :processor
  
  def initialize(name, price, brand, specs)
    super(name, price, brand)
    @ram = specs[:ram]
    @size = specs[:size]
    @processor = specs[:processor]
  end
end