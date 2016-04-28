require 'pry'

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
  OR: ["Portland", "Salem"],
  FL: ["Tampa", "Orlando"],
  CA: ["Fresno", "Napa"],
  NY: ["New York City", "Buffalo"],
  MI: ["Grand Rapids", "Detroit"],
  NV: ["Reno", "Vegas"],
  UT: ["Salt Lake City", "Binbrook"]
}



def describe_state
  puts "Please enter state code"
  key = gets.chomp.to_sym
  puts "#{key} is for #{@states.fetch(key)}. It has 2 major cities "
end

@taxes = {
  OR: 7,
  FL: 8,
  CA: 7.5,
  NY: 8.5,
  MI: 9,
  NV: 10,
  UT: 9.5
}

def calculate_tax
  puts "Please enter state code"
  key = gets.chomp.to_sym
  puts "Please enter amount"
  amount = gets.chomp.to_f
  taxes_included = @taxes[key].to_f / 100 * amount + amount
  puts taxes_included.round(2)
end

def find_state_for_city
  puts "Please enter city name"
  input_city = gets.chomp
  @cities.each do |state, city|
    if city.include? input_city
      puts "The state code is #{@states[state]}"
    end
    
  end



    # binding.pry
end


# puts states
# puts cities
# puts describe_state
# calculate_tax
find_state_for_city
# puts @cities[:NV].to_s
