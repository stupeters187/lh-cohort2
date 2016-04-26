def input
  puts "Welcome to Shakil the dog"
  puts "What do you say to Shakil?"
  answer = gets.chomp.to_s
end

def case_statement
  loop do
    case input
    when /woof/
      puts "WOOF WOOF WOOF"
    when /shakil stop/
      puts "silence......"
    when /meow/
      puts "woof woof woof woof woof"
    when /treat/
      puts "sits nicely"
    when /go away/
      break
    else
      puts "woof"      
    end
  end
end

case_statement


