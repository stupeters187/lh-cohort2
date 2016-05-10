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
      @@conn.exec('SELECT * FROM contacts ORDER BY id;') do |results|
         results.map do |c|
         puts "#{c['id']} #{c['name']} #{c['email']} "
        end
      end
    end


   def create(name, email)
      contact = Contact.new(name, email)
      @@conn.exec_params("INSERT INTO contacts (name, email) VALUES ($1, $2);", [contact.name, contact.email]) 
      
      
    end
    
    # def find(id)
    #   CSV.foreach('contacts.csv') do |contact|
    #     @find_contact =  id == contact[0].to_i
    #       if @find_contact
    #         puts contact
    #         break
    #       end
    #     end
    #     puts "Not found" if @find_contact == false
    # end

     def find(id)
      @@conn.exec_params('SELECT * from contacts WHERE id=$1',[id]) do |results|
        results.map do |c|
        puts "#{c['id']} #{c['name']} #{c['email']} "
        end
      end
    end
      
    def update(id, new_name, new_email)
      @@conn.exec('UPDATE contacts SET name = $2, email = $3 WHERE id = $1::int;', [id, new_name, new_email])
      puts "Contact updated"
    end

    def delete(id)
      @@conn.exec('DELETE FROM contacts WHERE id = $1::int;', [id])
    end

    
    def search(term)

      results = @@conn.exec_params("SELECT * FROM contacts WHERE name LIKE '%#{term}%' ") 
      results.map do |contact|
        puts "#{contact['id']}: #{contact['name']} #{(contact['email'])}"
      end
    end
  end
end