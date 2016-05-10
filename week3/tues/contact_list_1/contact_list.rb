require_relative 'contact'

class ContactList

  case ARGV[0]
  when /new/
    puts "Please enter a name"
    name = STDIN.gets.chomp
    puts "Please enter an email"
    email = STDIN.gets.chomp
    Contact.create(name, email)
  when /list/
    Contact.all
  when /show/
    Contact.find(ARGV[1].to_i) 
  when /search/
    Contact.search(ARGV[1])
  else
    puts "Here is a list of available commands\n
          new   -Create a new contact\n
          list  -List all contacts\n
          show  -Show a contact\n
          search -Search contacts\n"
  end
end

