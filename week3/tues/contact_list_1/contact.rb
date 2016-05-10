require 'csv'
require 'pry'
require 'pg'
require 'pp'

class Contact

    @@conn = PG.connect(
      host: 'localhost',
      dbname: 'postgres',
      user: 'development',
      password: 'development')

  attr_accessor :name, :email, :id
  
  def initialize(name, email)
    @name = name
    @email = email
  end

  class << self

     def all
      @@conn.exec('SELECT * FROM contacts;') do |results|
         results.map do |c|
         puts "#{c['id']} #{c['name']} #{c['email']} "
        end
      end
    end


   def create(name, email)
      contact = Contact.new(name, email)
      @@conn.exec_params("INSERT INTO contacts (name, email) VALUES ($1, $2);", [contact.name, contact.email]) 
      
      
    end
    
    def find(id)
      CSV.foreach('contacts.csv') do |contact|
        @find_contact =  id == contact[0].to_i
          if @find_contact
            puts contact
            break
          end
        end
        puts "Not found" if @find_contact == false
    end
    
    def search(term)
      count = 0
      r_term = /\b#{term}.*/
      CSV.foreach('contacts.csv') do |contact|

        if contact.to_s.match(r_term)

          puts "#{contact[0]}: #{contact[1]} #{(contact[2])}"
          count += 1
        end
      end
      puts "#{count} Record total"
    end
  end
end