class Customer

  attr_reader :budget, :cart

  def initialize(budget=500)
    @budget = budget || 500
    @cart = []
  end

  def add_to_cart(item)
    if @cart.length < 5 
      @cart.push(item)
    else
      false
    end
  end
end