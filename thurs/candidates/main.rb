# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here



# pp qualified_candidates(@candidates)

# pp ordered_by_qualifications(@candidates)


  loop do 
    puts "Please enter a command(find, all, qualified, quit)"
    input1 = gets.chomp
    input2 = input1.split(" ")
    case input2[0]
    when 'find'
      find(input2[1])
    when 'all'
      pp all_candidates
    when 'qualified'
      pp qualified_candidates(@candidates)
    when 'quit'
      break
    end
  end



