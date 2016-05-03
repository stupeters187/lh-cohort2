require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
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
    puts "Please enter contact id"
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

