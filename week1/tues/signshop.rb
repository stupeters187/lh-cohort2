@sqft = 0
@colours = 0

def create_order_sqft
  puts "Welcome to the sign shop"
  puts
  puts "Please enter the square footage"
  @sqft = gets.chomp.to_i
end

def create_order_colour_amnt
  puts "Please enter the number of colours"
  @colours = gets.chomp.to_i
end

def order_calculation
  subtotal1 = @sqft * 15
  if @colours < 2
    subtotal2 = @colours * 10
  else
    subtotal2 = @colours * 15
  end
  pre_tax_total = subtotal1 + subtotal2
  puts "Your order will cost #{pre_tax_total}"
end

create_order_sqft
create_order_colour_amnt
order_calculation