@states = {
  OR: "Oregon",
  FL: "Florida",
  CA: "California",
  NY: "New York",
  MI: "Michigan"
}

@states[:NV] = "Nevada"
@states[:UT] = "Utah"

@cities = {
  NV: ["Reno", "Vegas"],
  UT: ["Salt Lake City", "Binbrook"]
}

def describe_state
  puts "Please enter state code"
  key = gets.chomp.to_sym
  puts "#{key} is for #{@states.fetch(key)}."
end

@taxes = {
  OR: 7,
  FL: 8,
  CA: 7.5,
  NY: 8.5,
  MI: 9
}

def calculate_tax
  puts "Please enter state code"
  key = gets.chomp.to_sym
  puts "Please enter amount"
  amount = gets.chomp.to_f


end

# puts states
# puts cities
# puts describe_state
calculate_tax
