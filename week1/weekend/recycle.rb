require 'pry'

def recycle_bottles(bottles) 
 bottles / 2
end

def recycle_caps(caps) 
 caps / 4
end

def bottle_remainder(bottles)
  bottles % 2
end

def cap_remainder(caps)
  caps % 4
end

puts "Welcome to Lighthouse Markets"
puts
puts "How much would you like to spend?"
customer_amount = gets.chomp.to_i

total_bottles = (customer_amount / 2)
empty_bottles = total_bottles
empty_caps = total_bottles


while (empty_bottles >= 2 || empty_caps >= 4)
  new_bottles = recycle_bottles(empty_bottles) + recycle_caps(empty_caps) 
  old_bottles = bottle_remainder(empty_bottles)
  old_caps = cap_remainder(empty_caps)

  empty_bottles = new_bottles + old_bottles
  empty_caps = new_bottles + old_caps
  total_bottles += new_bottles
end

puts "For that amount you will recieve #{total_bottles} total bottles"








