require_relative 'contact'

class ContactList < ActiveRecord::Base


  case ARGV[0]
  
  when /new/
    puts "Please enter a name"
    name = STDIN.gets.chomp
    puts "Please enter an email"
    email = STDIN.gets.chomp
    Contact.create(name: "#{name}", email: "#{email}")
  
  when /list/
    Contact.all.each { |c| puts c.output}
  
  when /show/
    contact = Contact.find(ARGV[1].to_i) 
    puts contact.output
  when /search/
    contact = Contact.find_by(name: ARGV[1])
    puts contact.output
  
  when /update/
    the_contact = Contact.find(ARGV[1].to_i)
    puts "Please enter new name"
    new_name = STDIN.gets.chomp
    puts "Please enter new email"
    new_email = STDIN.gets.chomp
    the_contact.update(name: "#{new_name}", email: "#{new_email}")
  
  when /delete/
    the_contact = Contact.find(ARGV[1])
    the_contact.destroy
  else
    puts "Here is a list of available commands\n
          new   -Create a new contact\n
          list  -List all contacts\n
          show  -Show a contact\n
          search -Search contacts\n"
  end
end

